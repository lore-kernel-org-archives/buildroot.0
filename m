From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 8 Mar 2016 10:51:14 -0300
Subject: [Buildroot] [PATCH] dt: fix binary operation errors
In-Reply-To: <1457139173-9535-1-git-send-email-sergio.prado@e-labworks.com>
References: <1457139173-9535-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <56DED8D2.8090805@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/03/16 21:52, Sergio Prado wrote:

> Some GCC toolchains does not define _BSD_SOURCE when passing -D_GNU_SOURCE, and
> that is causing the declaration of large_t as double.
>
> In that case, GCC is complaining in some binary operations like the code below:
>
> dtgen.c:1653:59: error: invalid operands to binary % (have ?large_t? and ?u_int32?)
>     (dip->di_data_limit != INFINITY) && (dip->di_data_limit % dip->di_dsize) ) {
>                                                             ^
>
> This patch adds a statement in the include file to define large_t as
> "long long int" when __GNUC__ is defined.
>
> Fixes:
> http://autobuild.buildroot.net/results/e7b803bd007c125e23eeae351acfc08628333706
> http://autobuild.buildroot.net/results/72ca2970db41463435765b90c069417b8bb8a3fd
> http://autobuild.buildroot.net/results/22d18f0ca19898be02118c64e615ffbbb23ee46d
> http://autobuild.buildroot.net/results/ab50d1d4af47b026da77a81224500a4627c718ac
> ...
>
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

Hi Sergio.
Actually the correct fix is detecting/using _DEFAULT_SOURCE :
http://pkgs.fedoraproject.org/cgit/rpms/dt.git/commit/dt-default-source-define.patch?id=a3107b34a3efc6af66a5f892514f233bb66eb6b5
See: http://man7.org/linux/man-pages/man7/feature_test_macros.7.html 
regarding _BSD_SOURCE deprecation and _DEFAULT_SOURCE.
Care to spin a v2 with the proper fix?
Regards.
