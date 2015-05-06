From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2015 23:32:18 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <1430945922.2395.16.camel@synopsys.com> (Alexey Brodkin's message
 of "Wed, 6 May 2015 20:58:43 +0000")
References: <20150506063017.6B6A61015C1@stock.ovh.net>
 <20150506094236.114894a2@free-electrons.com>
 <1430945922.2395.16.camel@synopsys.com>
Message-ID: <87vbg5mly5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Hi Thomas,
 > On Wed, 2015-05-06 at 09:42 +0200, Thomas Petazzoni wrote:
 >> > arc | python-2.7.9 | NOK |
 >> http://autobuild.buildroot.net/results/4c694d715f66de49964ef36f7236c7575c3a0b5a/
 >> 
 >> relocation R_ARC_32 against `.text' can not be used when making a
 >> shared object; recompile with -fPIC

 > That failure looks pretty expected to me.
 > In defconfig
 > (http://autobuild.buildroot.net/results/4c6/4c694d715f66de49964ef36f7236c7575c3a0b5a/defconfig)
 > I see "BR2_STATIC_LIBS=y". And libffi is built statically then. In
 > that case fixed relocation R_ARC_32 is used (symbol gets resolved
 > during final linkage and then offset is inserted in-place in .text
 > section which means there's no way to relocate that symbol later on).

 > ctypes.so is attempted to be built dynamically and here our linker
 > throws an error:

Hmm, why is it even building python when python depends on
!BR2_STATIC_LIBS?

It seems like I forgot to propagate that dependency:

git grep -l 'select BR2_PACKAGE_PYTHON$'
package/dstat/Config.in
package/gnuradio/Config.in
package/kodi/Config.in
package/ola/Config.in
package/samba4/Config.in

But everything but kodi and gnuradio can be built statically:

git grep -l 'select BR2_PACKAGE_PYTHON$'|xargs grep -l STATIC_LIBS
package/gnuradio/Config.in
package/kodi/Config.in

From the defconfig I guess the reason here was dstat.

I'll fix these dependencies now, thanks.

-- 
Bye, Peter Korsgaard
