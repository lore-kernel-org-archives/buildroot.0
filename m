From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jul 2020 14:10:49 +0200
Subject: [Buildroot] local autobuild failures
In-Reply-To: <CAEyMn7YeeODW9bKxQYY1oXotvyNG+QX41kbGhmrHKiqOsd0hdQ@mail.gmail.com>
References: <CAEyMn7YeeODW9bKxQYY1oXotvyNG+QX41kbGhmrHKiqOsd0hdQ@mail.gmail.com>
Message-ID: <20200718141049.115c1bb0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 18 Jul 2020 08:14:39 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> uclibc:
> https://pastebin.com/D459072K
> https://filebin.net/ciweyuk38es1igea

This one is I believe a build environment issue indeed: you need one
UTF-8 locale available in your system. However, this is normally
checked by the following bits of code in
support/dependencies/dependencies.sh:

if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
        if ! which locale > /dev/null ; then
                echo
                echo "You need locale support on your build machine to build a toolchain supporting locales"
                exit 1 ;
        fi
        if ! locale -a | grep -q -i -E 'utf-?8$' ; then
                echo
                echo "You need at least one UTF8 locale to build a toolchain supporting locales"
                exit 1 ;
        fi
fi

Could you have a look at whether you have an UTF-8 locale or not ?

> haproxy:
> https://pastebin.com/YxSv6FSJ
> https://filebin.net/pydnt9vdhfkzn53n

This is not a build environment issue. Either it is fixed by commit
37eda7196e3414fbd3a054b7b43980d2219faffb, or it is another related
issue, but clearly not related to your build environment.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
