From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2015 14:07:39 +0200
Subject: [Buildroot] [PATCH 2/3] package/rsyslog: Fix linking against
 postgresql
In-Reply-To: <XnsA4798AC8357A8berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1428738737-3238-1-git-send-email-bernd.kuhls@t-online.de>
 <1428738737-3238-2-git-send-email-bernd.kuhls@t-online.de>
 <20150411124226.726fde30@free-electrons.com>
 <XnsA4798AC8357A8berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20150411120739.GF4221@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-04-11 13:38 +0200, Bernd Kuhls spake thusly:
> Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote
> in news:20150411124226.726fde30 at free-electrons.com: 
> 
> > Dear Bernd Kuhls,
> > 
> > On Sat, 11 Apr 2015 09:52:16 +0200, Bernd Kuhls wrote:
> >> Configure misses libm and libpthread when checking for postgresql.
> >> Patching configure.ac did not fix the problem so we patch configure
> >> directly, 
> > 
> > Hum, why?
> > 
> > It seems a bit backward to remove AUTORECONF = YES to then add a patch
> > that modifies the configure script directly.
> 
> Hi,
> 
> I tried to add "-lm -lpthread" to line 615 in configure.ac:
> 
> -     PGSQL_LIBS="-L`$PG_CONFIG --libdir` -lpq"
> +     PGSQL_LIBS="-L`$PG_CONFIG --libdir` -lm -lpthread -lpq"
> 
> Original configure, line 17388, looks like this before autoreconf
> 
> LIBS="-lpq -L`$PG_CONFIG --libdir`
> 
> and, as line 17865, it still looks the same causing postgresql detection
> to fail... 
> 
> Please note that -lpq is on the first position in this variable, I have no
> idea how to change this line in configure without patching that file
> directly. 

That's because this line is generated from the 5th argument to
AC_CHECK_LIB, which contains the 'other-libraries':

    https://www.gnu.org/software/autoconf/manual/autoconf.html#Libraries

    If linking with library results in unresolved symbols that would be
    resolved by linking with additional libraries, give those libraries
    as the other-libraries argument, separated by spaces: e.g., -lXt
    -lX11. Otherwise, this macro may fail to detect that library is
    present, because linking the test program can fail with unresolved
    symbols. The other-libraries argument should be limited to cases
    where it is desirable to test for one library in the presence of
    another that is not already in LIBS.

The part you wanted change is the third argument of AC_CHECK_LIB, which
is the 'action-if-found', and thus gets run only if the check is OK,
which can occure, given that those extra libs are not passed in
'other-libraries'.

The correct and definitive solution would be to fully use pg_config to
get the libraries we need to link to.

Unfortunately, pg_config is a binary, so we provide our own minimalist
one, which does not implement --libs.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
