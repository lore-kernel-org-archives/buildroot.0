From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jul 2013 14:02:01 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-07-11
In-Reply-To: <20130712063004.D528352C0F3@lolut.humanoidz.org>
References: <20130712063004.D528352C0F3@lolut.humanoidz.org>
Message-ID: <20130712140201.01aa5f29@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Jul 2013 08:30:04 +0200 (CEST), Thomas Petazzoni wrote:

>       bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/351c6fc4266ac7b545b027f387b6154f380e4cbc/
>    powerpc | make: *** [alsamixergui-leg... | NOK | http://autobuild.buildroot.net/results/16683f71a6049cd6eda5f34b486a013fc5ae753d/
>        arm | make: *** [bluez_utils-lega... | NOK | http://autobuild.buildroot.net/results/bd51197f4786de1c45ccbe085eb7b95c0fc437b6/
>        arm | make: *** [cifs-utils-legal... | NOK | http://autobuild.buildroot.net/results/b45a1d48ecb577e6d16226dbe3acc69274a20189/
>        arm | make: *** [cifs-utils-legal... | NOK | http://autobuild.buildroot.net/results/eedb3b491d39824ffd912dbb215b112584394cd7/
>    powerpc | make: *** [cpuload-legal-in... | NOK | http://autobuild.buildroot.net/results/9c44874084d417b18bbaba0ea214520527ca6107/
>     x86_64 | make: *** [dhcpdump-legal-i... | NOK | http://autobuild.buildroot.net/results/a53446e90a9ae72d16d6f39b5a68e0d4e05145f1/
>       i686 | make: *** [dhcpdump-legal-i... | NOK | http://autobuild.buildroot.net/results/eae085aa9ee97bc0bf46e0162b80417b074184ee/
>    powerpc | make: *** [elfutils-legal-i... | NOK | http://autobuild.buildroot.net/results/c18bc6900eddaa37272f306e2f9b1f8befe0b3f2/
>    powerpc | make: *** [fis-legal-info] ... | NOK | http://autobuild.buildroot.net/results/4c5acfb9d83fdba557399549a8df87346dffb699/
>     x86_64 | make: *** [fontconfig-legal... | NOK | http://autobuild.buildroot.net/results/b0fa862f0000c77cf28a215cc5350a3ff2bfbbf4/
>       i686 | make: *** [gpsd-legal-info]... | NOK | http://autobuild.buildroot.net/results/5a0f820b8ef59deff864eae0435602e1dd5a1562/
>    powerpc | make: *** [host-e2fsprogs-l... | NOK | http://autobuild.buildroot.net/results/d683d9e3d2518e9a5ca95f0ae6eea3593a46a163/
>     x86_64 | make: *** [libcurl-legal-in... | NOK | http://autobuild.buildroot.net/results/2ed924bb3a0d27298816843318a2d92e77f93a86/
>     x86_64 | make: *** [libnl-legal-info... | NOK | http://autobuild.buildroot.net/results/621094a88d43cf15342582717ff86fb657f4fd81/
>       i686 | make: *** [lua-msgpack-nati... | NOK | http://autobuild.buildroot.net/results/7354f5540fbce6e4f4e9f28371f1c4227d1d3193/
>       sh4a | make: *** [oprofile-legal-i... | NOK | http://autobuild.buildroot.net/results/009f333335716f3a6fbb4514751c1295d03c59c9/
>       i686 | make: *** [rsh-redone-legal... | NOK | http://autobuild.buildroot.net/results/7ab075dfb7cb76a482042f0eb2133379c5909aa5/

I believe all those legal-info issues were due to a recent change I did
in the autobuilders: before each build, I'm removing 5 random tarballs
from the download directory. The idea is that by removing tarballs, the
autobuilders would be re-downloading them from time to time, and
therefore autobuilders will see if the upstream site has disappeared,
the URL has changed, or something (until now, a given tarball was
downloaded once forever, and so we were not necessarily seeing the
issues that our users were having in terms of download).

However, my autobuilder server runs 3 parallel builds, and they share
the same download directory. So what was probably happening is that a
given build uses a tarball, the builds is fine, but then before the end
of this build, another build got started, and removed a bunch of
tarballs, including one the former build was interested in. And bang
during the legal-info thing. It was probably not happening between
download/extract because the time window is much shorter, but between
extract and legal-info, the entire build takes place.

So I've fixed that by doing one separate download directory for each
parallel build instance. Each build instance is removing 5 random
tarballs before each build, but from its own private download directory.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
