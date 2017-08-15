From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 15 Aug 2017 15:59:53 +0200
Subject: [Buildroot] [PATCH] lua: fix install of lua.pc
In-Reply-To: <93725030-7abe-4bed-30e8-19b7dbde5b3c@mind.be>
References: <20170813133111.3959-1-francois.perrad@gadz.org>
 <20170814222528.1ca21238@windsurf>
 <CAB0FRsuYHMSgoMqpkyq2ieQL54hh6EVywUTv=jBAqdgNZcZdWw@mail.gmail.com>
 <20170815103948.5e910211@windsurf>
 <CAB0FRsvzktuPOcsADkydwxjBVCQZJ-ZB090wTL_mfzTKo9TZjg@mail.gmail.com>
 <93725030-7abe-4bed-30e8-19b7dbde5b3c@mind.be>
Message-ID: <CAB0FRstouYUFL1R8Q0kQ8xHXyDX+0CiwfYy0u-2jdFPx4=UdpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-08-15 12:32 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:

>
>
> On 15-08-17 11:12, Fran?ois Perrad wrote:
> > In order to keep a code base clean , I am against mixing the
> responsability of
> > different steps.
> > In my point of view, the install step must only:
> >     - copying files
> >     - modifying the mode of files
> >     - rename files
> >     - create symbolic links
>
>  The current situation, at least, is also that fixing up files is done in
> (post-)install. Cfr. $(PKG)_CONFIG_SCRIPTS), fixup of libtool files. And
> several
> packages already do additional fixups in post-install.
>
>  In this particular case, however, it does make more sense to make this
> modification in the configure step. Well, except that the .pc file is
> something
> we add ourselves with a patch... So in fact, in this particular case, it
> would
> make more sense to do it in post-install, but to get the .pc file from
> package/lua/lua.pc.in instead of patching lua to get it. Except of course
> in
> case the patch has been accepted upstream, then it would make more sense
> to do
> what you propose.
>
>  So, in my opinion, there are two possibilities:
>
> 1. 0004-lua-pc.patch has been accepted upstream. In that case, the proper
> thing
> to do would be to:
>   a. patch lua's Makefile to also substitute @MYLIBS@
>   b. send the resulting patch upstream
>
> 2. lua.pc has not been accepted upstream. In that case, the proper thing
> to do
> would be to replace the patches with package/lua/lua.pc.in
>
>
>  In either case, however, this is more a matter of making things nicer, it
> doesn't fix anything and it hardly makes things more maintainable. Only if
> lua.pc is upstream, then Joerg's fix should be improved and also sent
> upstream.
>
>
>
Patches will be not upstreamed, below the story:
- In Lua 5.1.x serie, a `lua.pc` was included in the upstream distribution.
But it was a static file which was not updated with the configuration used
during the build.
- With the Lua 5.2.x serie, the upstream team decides to remove it.
I create a patch in serie 5.2 (and after in 5.3) which restores the same
behavior like in 5.1.
This allows to install a static `lua.pc` in the 3 series.

These days, J?rg Krause makes `lua.pc` dynamic with correct data (ie.
@MYLIBS@) in serie 5.2 & 5.3.

A common template `lua.pc.in` could be written with only 3 variables :
LUA_VERSION, LUA_SERIE, MYLIB.

Fran?ois



>  Regards,
>  Arnout
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170815/a5f8badc/attachment.html>
