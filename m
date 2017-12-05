From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 05 Dec 2017 20:34:59 +0100
Subject: [Buildroot] [PATCH 1/1] erlang: bump to version 20.0
References: <20171130154202.437-1-johan.oudinet@gmail.com>
 <20171203105905.3bdd1dc9@windsurf.lan>
 <CAJtjsKYbRp-NcBxLfc-Xner7TUQuA8i3EjuR0QXgq908+Nwt6w@mail.gmail.com>
Message-ID: <309jfexdr8.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 04 Dec 2017 17:32:31 +0100 schrieb Johan Oudinet:

> What bother me is that I can't find which changes from OTP 19.3 to OTP
> 20.0 could lead to this error.

Hi,

I think I found the commit, added with version 20.0, which causes the 
error: https://github.com/erlang/otp/
commit/640c988fd41f9709b494554b2e5ef1f06f06957e

The autoconf function AC_SEARCH_LIBS adds "-llibrary to LIBS for the 
first library found to contain function" according to the autoconf manual:
https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/
Libraries.html

And this is exactly what happens:

host-erlang-20.0/erts/config.status contains

S["LIBS"]="-lz -lutil -ldl -lm   "

while host-erlang-19.3/erts/config.status lacks -lz:

S["LIBS"]="-lutil -ldl -lm   "

The content of this variable is used to build dyntrace.o with this 
Makefile: lib/runtime_tools/c_src/Makefile.in, line 98.

Unfortunately I do not have more time to look for a fix today.

Regards, Bernd
