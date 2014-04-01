From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Apr 2014 20:35:34 +0200
Subject: [Buildroot] [PATCH WIP 15/16] xbmc: Bump version to Gotham_beta3
In-Reply-To: <qi8r0bx5mu.ln2@ID-313208.user.individual.net>
References: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
 <1396296389-28821-16-git-send-email-bernd.kuhls@t-online.de>
 <20140331220546.GD5004@free.fr>
 <qi8r0bx5mu.ln2@ID-313208.user.individual.net>
Message-ID: <20140401183534.GB3291@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-04-01 19:11 +0200, Bernd Kuhls spake thusly:
> Hi,
> 
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
> news:20140331220546.GD5004 at free.fr:
> 
> >   - a first patch to bump
> >   - a second to add uClibc support
> 
> both is done by the version bump to Gotham. Frodo does not support uClibc, 
> Gotham will do thanks to the two small patches[1] I sent to the xbmc team ;) 

Great! Thanks! :-)

> Why I do not like the idea to split the Config.in patch? See next comment...
> 
> >   - a third to add mesa3d
> >   - a fourth to add vaapi
> > 
> > This will make it easier to review.
> 
> I am not sure if the version bump alone creates a bisectable, that means 
> buildable xbmc package. My time is limited, so I prefer not to test four 
> different patches for "complex beasts like XBMC" and their ability, that each 
> of them still compiles without errors.

I can understand that your time is precious. But so is mine, and all the
other reviewers.

Reviewing small patches is much easier than reviewing a single patch
with many changes. We already have some difficulties finding time to
review even simple patches, that when we see a large patch, it is just
not that appealing.

For example, you're saying that bumping to Gotham will enable us to
build on uClibc. That's fine, but they are two different things:
  - a bump of version, which keeps the same feature-set
  - a new feature, which is to build with uClibc

If something goes amiss with uClibc, we can just revert that and keep
the bump. If it was a single change, we'd have to revert all of it
just because of the failure of a single new feature.

Ditto with mesa3d and vaapi. If only vaapi has a problem and it is in a
single patch, we may have to revert the whole thing, while if vaapi is
in its own patch, it is easy to revert [*].

Note also, that many of the XBMC sub-options have dependencies on
toolchain features (eg. IPv6, threads, and so on...) which are not
currently expressed, being implicit as XBMC depends on (e)glibc, and so
those features are guaranteed to be present in this case. But when
enabling building with uClibc, those dependencies will have to be added,
which is not a trivial change. And your patch is missing all those new
required dependencies. Having split-patches will make it easier to check
those dependencies.

But in the end, if you can't find the time to split the patch into
atmic, semantically-separated patches, you are still welcome to post
your work on the list. :-) Maybe someone will be interested enough that
he'll get your patch, do the split himself, and resubmit the splitted
patches.

[*] revert: in case the fix is not obvious, the best approach is to
revert changes until they are fixed. Of course, if the ix is trivial,
there is no revert needed, but better safe than sorry.

> > As you said, we should consider this bump as an RFC: better wait for the
> > final release rather than bundle a beta release.
> 
> Of course ;) But we should start testing, especially on non-intel platforms. 
> If something is missing, we still have a chance to get it into Gotham release 
> code.

Yes. I'm sure Maxime will be very happy not to have to handle this bump! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
