From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  6 Jun 2015 10:09:02 +0000 (UTC)
Subject: [Buildroot] [Bug 8156] pkg-kconfig infra broken for
	*-update-{config, defconfig}
In-Reply-To: <bug-8156-163@https.bugs.busybox.net/>
References: <bug-8156-163@https.bugs.busybox.net/>
Message-ID: <20150606100902.DC15580438@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8156

--- Comment #11 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-06-06 10:09:01 UTC ---
Floris, All,

(In reply to comment #10)
> (In reply to comment #9)
> > Floris,
> > 
> > (In reply to comment #8)
> > > But shouldn't make bail out with a "No rule to make target name-of-file" type
> > > of error first because the input files do are listed as a dependency for
> > > .config?
> > > 
> > > $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
> > 
> > Yep, I would have expected so, too. But it does not...
> > 
> > I'm using make-3.81, and it does not error-out. I've installed a
> > make-4.0, and it does not break either.
> 
> Strange, that dependency rule did work for me when I submitted and tested the
> kconfig patch.

Nah, it did not work, because it is not the same thing.

What is not working is checking the _base_ kconfig file; a missing base
kconfig file is not caught, but missing fragments are properly caught
(but that's a problem, too).

The problem is that the base kconfig file has a dependency, but no rule,
and in this case is a non-existent file, so "make imagines this target
to have been updated whenever its rule is run. This implies that all
targets depending on this one will always have their recipe run."

    https://www.gnu.org/software/make/manual/make.html#Force-Targets

And this is exactly what happens here... Sigh...

I've already fixed that.

Now, I'm also saying that detecting missing fragments is an issue,
because they do not depend on the package being extracted first (like
the base kconfig file does), in case they are bundled in the package.

I'm fixing that now.

> And seems it worked for Arnout as well:
> http://lists.busybox.net/pipermail/buildroot/2015-May/127584.html
> 
> But that's when running make normally with a fragment file missing that do was
> specified. Haven't tested the exact scenario reported in this bug, and looked
> what might make it different.

Don't worry, it's not your fault, the bug was pre-existing the kconfig
fragments, but that's what exposed it.

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
