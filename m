From: Julien Letessier <julien.letessier@technosens.fr>
Date: Wed, 20 Jun 2007 11:53:40 +0200
Subject: [Buildroot] Easy packaging - Makefile.autotools.in with extra
	make magic
In-Reply-To: <f0528b5b0706140808s41ac007fn7f25a58b06e4b2f4@mail.gmail.com>
References: <f0528b5b0706140808s41ac007fn7f25a58b06e4b2f4@mail.gmail.com>
Message-ID: <f0528b5b0706200253v702e78c3x4a802e4c9452d60@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi List and Benjamin,

Sorry for not replying directly/sooner: for some reason I didn't
receive your answer (or my own email) from the list.

Summary of mail below: I fixed Makefile.autotools.in to address the
issues Benjamin stated.
The updated autotools and example (alsa-lib) patches are attached.

Benjamin wrote:

> First let me thank you for your work. There are lots of good ideas in.

Thanks :)

> But I think there is another problem since _every_ package gets
> installed in ths staging_dir now. It should be fixed, that only
> packages that need it (like libraries) are installed there; also the
> -clean target should be fixed that way...

Ok, that's a pretty simple fix. Packages will have to define a
FOO_INSTALL_STAGING=YES variable if they need to be installed to the
staging dir (i.e. it defaults to NO). I also added a
FOO_INSTALL_TARGET variable (defaults to YES), because some packages
(like the X protocol packages) only install headers, for instance.

This said, not installing packages to the staging dir only saves a
little space and time on the build machine... for the 20% of packages
the are *not* libraries.

> The user-defined variables in a Makefile should be all UPPERCASE to
> prevent them from confusion with commands. (The mixed-case even doesn't
> look as good as the uppercase).

Not using uppercase was due to my lazyness. But again, a simple fix.

> A word on the PACKAGE_SITE: it might have an default, like
>
> 252: $(1)_SITE ?= http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/$(1)/

Added. Also added a default FOO_SOURCE for packages hich use an
archive named foo-1.0.tar.gz

> By the way, what about a user defined GNU-Mirror - the official one is
> sometimes real slow...

That would be an excellent idea, but its beyond the scope of the
autotools makefile... Do you have such a patch ready?

> Just another word on the replace.sh: why? ( I'm afraid of hundreds of stupid
> scripts lying around somewhere)
> It is used only once and could be substituted by something like
> 	
> 	for i in $(find $(STAGING_DIR)/usr/lib/ -name \*.la); do \
> 		mv "$i" "$i~"; \
> 		$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:" "$i~" > "$i";\
> 	done

Again, laziness. Fixed with the above.

Just one error in your code snippet -- correct me if i'm wrong.
you can't use the $(find ...) make function here, because it's
evaluated before the make rule is run, i.e. before the package is
actually installed. So I replaced it with a $$(find) shell call to the
'find ' command.

> Even while this lacks the nice line of output, it reuses the $(SED) var,
> since not all systems have an installed sed (or didn't have it in the
> PATH). so it is easier to port. The second issue I can imagine is if
> someone  is using an regex containing an unescaped ':'. Since you hided
> it that nice it would take some time... Uhh, remember all the poor users
> of M$-OSs; they all might have an ':' in their $(STAGING_DIR) ("C:\My
> Files\buildroot") ...

Fixed.
I didn't realise buildroot also runs under Windows... In fact I tried
(unsuccessfuly) to get it to run under Darwin.

Thanks for the feedback!
Updated autotools and alsa-lib patches attached.
-- 
Julien Letessier
<julien.letessier@technosens.fr>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: autotools3.patch
Type: application/octet-stream
Size: 13169 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070620/a6d4f42f/attachment.obj 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: alsa2.patch
Type: application/octet-stream
Size: 1285 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070620/a6d4f42f/attachment-0001.obj 
