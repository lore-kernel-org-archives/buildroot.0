From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Aug 2017 12:32:38 +0200
Subject: [Buildroot] [PATCH] lua: fix install of lua.pc
In-Reply-To: <CAB0FRsvzktuPOcsADkydwxjBVCQZJ-ZB090wTL_mfzTKo9TZjg@mail.gmail.com>
References: <20170813133111.3959-1-francois.perrad@gadz.org>
 <20170814222528.1ca21238@windsurf>
 <CAB0FRsuYHMSgoMqpkyq2ieQL54hh6EVywUTv=jBAqdgNZcZdWw@mail.gmail.com>
 <20170815103948.5e910211@windsurf>
 <CAB0FRsvzktuPOcsADkydwxjBVCQZJ-ZB090wTL_mfzTKo9TZjg@mail.gmail.com>
Message-ID: <93725030-7abe-4bed-30e8-19b7dbde5b3c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-08-17 11:12, Fran?ois Perrad wrote:
> In order to keep a code base clean , I am against mixing the responsability of
> different steps.
> In my point of view, the install step must only:
>     - copying files
>     - modifying the mode of files
>     - rename files
>     - create symbolic links

 The current situation, at least, is also that fixing up files is done in
(post-)install. Cfr. $(PKG)_CONFIG_SCRIPTS), fixup of libtool files. And several
packages already do additional fixups in post-install.

 In this particular case, however, it does make more sense to make this
modification in the configure step. Well, except that the .pc file is something
we add ourselves with a patch... So in fact, in this particular case, it would
make more sense to do it in post-install, but to get the .pc file from
package/lua/lua.pc.in instead of patching lua to get it. Except of course in
case the patch has been accepted upstream, then it would make more sense to do
what you propose.

 So, in my opinion, there are two possibilities:

1. 0004-lua-pc.patch has been accepted upstream. In that case, the proper thing
to do would be to:
  a. patch lua's Makefile to also substitute @MYLIBS@
  b. send the resulting patch upstream

2. lua.pc has not been accepted upstream. In that case, the proper thing to do
would be to replace the patches with package/lua/lua.pc.in


 In either case, however, this is more a matter of making things nicer, it
doesn't fix anything and it hardly makes things more maintainable. Only if
lua.pc is upstream, then Joerg's fix should be improved and also sent upstream.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
