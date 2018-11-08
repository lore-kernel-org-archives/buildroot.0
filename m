From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Nov 2018 23:58:10 +0100
Subject: [Buildroot] [PATCH 1/3] fs: apply permissions late
In-Reply-To: <4f9a31b0fb8f87ded9c788cb92d727b6763859ac.1540626349.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 27 Oct 2018 09:45:58 +0200")
References: <cover.1540626349.git.yann.morin.1998@free.fr>
 <4f9a31b0fb8f87ded9c788cb92d727b6763859ac.1540626349.git.yann.morin.1998@free.fr>
Message-ID: <87bm6z89dp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The combination of fakeroot, tar, and capabilities is broken, because
 > fakeroot currently badly handles capabilities, which are currently
 > simply ignored.

 > As described in #11216, asking tar to explicitly store and restore
 > capabilities ends up with a failling build, when tar actually tries to
 > restore the capabilities. Adding support for capabilities to fakeroot
 > (by adding host-libcap as dependency) does not fix the problem.

 > Capabilities are stored in the extended attribute security.capabilty.
 > It turns out that tar does have special handling when extracting and
 > restoring that extended attribute, and that fails miserably when running
 > under fakeroot...

Hmm, playing a bit around with tar here (1.29, Debian) it looks like it
doesn't actually extract the security.capability xattrs when --xattrs is
used unless --xattrs-include='*.*' is used:

getcap /usr/bin/i3status
/usr/bin/i3status = cap_net_admin+ep

sudo tar -cvvvf foo.tar /usr/bin/i3status
tar: Removing leading `/' from member names
-rwxr-xr-x root/root     84888 2017-01-21 15:42 /usr/bin/i3status
hexdump -C foo.tar | grep -A2 ecu

No security.capability in the .tar

sudo tar --xattrs -cvvvf foo.tar /usr/bin/i3status
tar: Removing leading `/' from member names
-rwxr-xr-x  root/root     84888 2017-01-21 15:42 /usr/bin/i3status
hexdump -C foo.tar | grep -A2 ecu
00000240  43 48 49 4c 59 2e 78 61  74 74 72 2e 73 65 63 75  |CHILY.xattr.secu|
00000250  72 69 74 79 2e 63 61 70  61 62 69 6c 69 74 79 3d  |rity.capability=|
00000260  01 00 00 02 00 10 00 00  00 00 00 00 00 00 00 00  |................|

With --xattrs they are included but not listed in the verbose output:

sudo tar --xattrs --xattrs-include='*.*' -cvvvf foo.tar /usr/bin/i3status
tar: Removing leading `/' from member names
-rwxr-xr-x* root/root     84888 2017-01-21 15:42 /usr/bin/i3status
  x: 20 security.capability
hexdump -C foo.tar | grep -A2 ecu
00000240  43 48 49 4c 59 2e 78 61  74 74 72 2e 73 65 63 75  |CHILY.xattr.secu|
00000250  72 69 74 79 2e 63 61 70  61 62 69 6c 69 74 79 3d  |rity.capability=|
00000260  01 00 00 02 00 10 00 00  00 00 00 00 00 00 00 00  |................|

Same .tar content but now also listed in the verbose output.


For extraction:

tar -xvvvf ../foo.tar && getcap usr/bin/i3status
-rwxr-xr-x root/root     84888 2017-01-21 15:42 usr/bin/i3status

No capability.

tar --xattrs -xvvvf ../foo.tar && getcap usr/bin/i3status
-rwxr-xr-x  root/root     84888 2017-01-21 15:42 usr/bin/i3status

Still no capability.

tar --xattrs --xattrs-include='*.*' -xvvvf ../foo.tar && getcap usr/bin/i3status
-rwxr-xr-x* root/root     84888 2017-01-21 15:42 usr/bin/i3status
  x: 20 security.capability
usr/bin/i3status = cap_net_admin+ep

Now it works.

I don't see where we are passing --xattrs-include. Are we sure this is a
fakeroot issue after all?

-- 
Bye, Peter Korsgaard
