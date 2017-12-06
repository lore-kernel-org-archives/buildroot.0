From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 6 Dec 2017 12:11:13 +0100
Subject: [Buildroot] [PATCH 1/1] erlang: bump to version 20.0
In-Reply-To: <309jfexdr8.ln2@ID-313208.user.individual.net>
References: <20171130154202.437-1-johan.oudinet@gmail.com>
 <20171203105905.3bdd1dc9@windsurf.lan>
 <CAJtjsKYbRp-NcBxLfc-Xner7TUQuA8i3EjuR0QXgq908+Nwt6w@mail.gmail.com>
 <309jfexdr8.ln2@ID-313208.user.individual.net>
Message-ID: <CAJtjsKbXPXe=_iN9oDyUXw_bGk3ROXDhga4h9QRPvRy0H8NM9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 5, 2017 at 8:34 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Am Mon, 04 Dec 2017 17:32:31 +0100 schrieb Johan Oudinet:
>
> I think I found the commit, added with version 20.0, which causes the
> error: https://github.com/erlang/otp/
> commit/640c988fd41f9709b494554b2e5ef1f06f06957e
>
> The autoconf function AC_SEARCH_LIBS adds "-llibrary to LIBS for the
> first library found to contain function" according to the autoconf manual:
> https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/
> Libraries.html
>
> And this is exactly what happens:
>
> host-erlang-20.0/erts/config.status contains
>
> S["LIBS"]="-lz -lutil -ldl -lm   "
>
> while host-erlang-19.3/erts/config.status lacks -lz:
>
> S["LIBS"]="-lutil -ldl -lm   "
>
> The content of this variable is used to build dyntrace.o with this
> Makefile: lib/runtime_tools/c_src/Makefile.in, line 98.
>

Good catch. I tried the workaround of adding --enable-builtin-zlib in
HOST_ERLANG_CONF_OPTS and it works.
So this is definitely an issue with how their use of AC_SEARCH_LIBS in
erts/configure.in leaks to how dyntrace.o is linked in
lib/runtime_tools/c_src/Makefile.in.

I don't think it is acceptable to use --enable-builtin-zlib in
buildroot packaging of Erlang but we're making progress.
-- 
Johan
