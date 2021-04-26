From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 Apr 2021 21:50:32 +0200
Subject: [Buildroot] [PATCH v2,
 2/2] package/domoticz: select boost atomic
In-Reply-To: <20210426191113.512637-2-fontaine.fabrice@gmail.com>
References: <20210426191113.512637-1-fontaine.fabrice@gmail.com>
 <20210426191113.512637-2-fontaine.fabrice@gmail.com>
Message-ID: <20210426195032.GN298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-04-26 21:11 +0200, Fabrice Fontaine spake thusly:
> domoticz does not use Boost::atomic but cmake is so "smart" that it
> (wrongly) assumes that Boost::thread depends on Boost:date_time and
> Boost::atomic since boost version 1.54:
> 
> set(_Boost_THREAD_DEPENDENCIES chrono date_time atomic)
> 
> Extracted from:
>  - https://gitlab.kitware.com/cmake/cmake/-/blob/master/Modules/FindBoost.cmake#L1113
> 
> As we can't patch every cmake on the field, just select boost atomic
> 
> It should be noted that build failures are only raised since commit
> 8a46b41b4a5d1c2f5ebefd7fc23fec7e8ba0598c as this commit drop the patch
> that was decreasing cmake version but also removing:
> 
> target_link_libraries(domoticz Boost::thread Boost::system)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4306c0a725ed9a34bd55550df428866db6e4f052
>  - http://autobuild.buildroot.org/results/2478e7a2ec1c63dcc2b36d29a39004468b230211
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Fix patch title
> 
>  package/domoticz/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
> index 83ae2035b2..26e79c18b7 100644
> --- a/package/domoticz/Config.in
> +++ b/package/domoticz/Config.in
> @@ -11,6 +11,7 @@ config BR2_PACKAGE_DOMOTICZ
>  	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
>  	select BR2_PACKAGE_BOOST
> +	select BR2_PACKAGE_BOOST_ATOMIC
>  	select BR2_PACKAGE_BOOST_DATE_TIME
>  	select BR2_PACKAGE_BOOST_SYSTEM
>  	select BR2_PACKAGE_BOOST_THREAD
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
