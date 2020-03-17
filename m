From: LP C <lpdev@cordier.org>
Date: Tue, 17 Mar 2020 11:56:22 +0100
Subject: [Buildroot] Improve external toolchain support
Message-ID: <1584441658.local-92915ea1-2b2b-v1.5.5-b7939d38@getmailspring.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I bring your attention about section 6.1.3 Build an external toolchain with Buildroot.
I have carefully followed the tutorial that explains how to make our own toolchain. I have seen few limitations of this approach though
As stated in the documentation, it is possible to point to a freshly created toolchain using "file://MY_TOOLCHAIN.tar.gz" path in the toolchain URL. However, this means that buildroot will "download" the file in the its dl folder. If you decide to regenerate MY_TOOLCHAIN.tar.gz, then buildroot will NOT detect the toolchain archive changed, and will use the MY_TOOLCHAIN.tar.gz cached in dl directory.
Integrity of the build is not achievable because the toolchain is not checked against in hash (local or remote). In toolchain/toolchain-external/toolchain-external-custom/toolchain-external-custom.mk, it is stated in the comment that "We can't check hashes for custom downloaded toolchains"

To solve these caveats that can heavily comprimise a build, these are my suggestions:

In buildroot makefile, detect that we are pointing to a local toolchain and always check using HASHES that toolchain in folder is the same as toolchain pointed by url. Not sure it's a good design though, because it can break the "make source" target.
Add BR2_TOOLCHAIN_EXTERNAL_CUSTOM_HASH, (under the form "md5sum MY_MD5", or "sha1 MY_SHA1") that provides a hash to check against the downloaded toolchain. Instead of silently using the wrong toolchain, it might be catched earlier in the build.

Thank you for your feedbacks on this, BR

Louis-Paul CORDIER
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200317/e698979a/attachment.html>
