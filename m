From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 23 Oct 2014 11:24:16 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-10-22
In-Reply-To: <20141023063017.0B8391011FF@stock.ovh.net>
References: <20141023063017.0B8391011FF@stock.ovh.net>
Message-ID: <20141023082416.GG2220@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, buildroot list,

On Thu, Oct 23, 2014 at 08:30:16AM +0200, Thomas Petazzoni wrote:
>          arm |                     ipset-6.23 | NOK | http://autobuild.buildroot.net/results/2ae233d33b05fac10e9b6676a6ca179c75e4c1d9/
>     mips64el |                     ipset-6.23 | NOK | http://autobuild.buildroot.net/results/4f55c2415281c6204500efe28fe9e24c8ef73863/

I started looking into these build failures and it makes me wonder. The direct 
cause of these failures is a combination of two things. Host header directory, 
/usr/local/include, being used for target build (clearly a bad thing), and 
-Werror. We normally remove -Werror since it is quite useless when you only 
want to build the package. The thing is that ipset add -Werror only when 
configures with --enable-debug, which in turn is triggered by 
BR2_ENABLE_DEBUG. This apparently causes other build issues as well 
(http://patchwork.ozlabs.org/patch/400834/). Does it make sense to remove 
-Werror in this case? This is after all what the user asks for when enabling 
BR2_ENABLE_DEBUG. But then again, does it make sense to have the autobuilder 
test BR2_ENABLE_DEBUG, given its relatively high rate of -Werror induced false 
positives?

What do others think?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
