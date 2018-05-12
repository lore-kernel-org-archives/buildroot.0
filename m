From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 May 2018 09:01:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/apr-util: fix ldap detection
In-Reply-To: <20180509193416.2148-1-bernd.kuhls@t-online.de>
References: <20180509193416.2148-1-bernd.kuhls@t-online.de>
Message-ID: <20180512090114.3c5900fe@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 May 2018 21:34:16 +0200, Bernd Kuhls wrote:
> configure checks if ldap_set_rebind_proc takes 2 or 3 arguments
> http://svn.apache.org/viewvc/apr/apr-util/tags/1.6.1/build/apu-conf.m4?revision=1812528&view=markup#l370
> 
> It uses the macro APR_TRY_COMPILE_NO_WARNING which adds -Werror to
> treat all warnings as errors when gcc is used:
> http://svn.apache.org/viewvc/apr/apr/tags/1.6.3/build/apr_common.m4?revision=1812527&view=markup#l504
> 
> In some buildroot configs a compiler warning occurs during this check:
> http://autobuild.buildroot.net/results/241/241ed78b93ce86c859e175530fa485711ff61615//apr-util-1.6.1/config.log
> 
> /home/rclinux/rc-buildroot-test/scripts/instance-1/output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/features.h:218:5:
>  error: #warning requested reentrant code, but thread support was disabled [-Werror=cpp]
> cc1: all warnings being treated as errors
> 
> Due to this warning 'ac_cv_ldap_set_rebind_proc_style' is set to two
> instead of three leading to a build error later on. This patch forces
> ac_cv_ldap_set_rebind_proc_style=three to be inline with openldap which
> fixes
> http://autobuild.buildroot.net/results/241/241ed78b93ce86c859e175530fa485711ff61615/
> 
> This solution was inspired by a discussion on the fink mailinglist:
> https://sourceforge.net/p/fink/mailman/message/31720482/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/apr-util/apr-util.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
