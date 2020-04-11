From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2020 20:02:24 +0200
Subject: [Buildroot] [PATCH 7/8] core/show-info: report the ordered list
 of build steps
In-Reply-To: <CAB4xu_1Bv4gsebOQrUfKM_ChD6q7-e15YTGPqwj4PBx3hzkrOA@mail.gmail.com>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <93a3545d1fe7b47cdfb32edc7db3fd54600fecd9.1586592741.git.yann.morin.1998@free.fr>
 <20200411103950.4a21b23e@windsurf.home>
 <CAB4xu_1Bv4gsebOQrUfKM_ChD6q7-e15YTGPqwj4PBx3hzkrOA@mail.gmail.com>
Message-ID: <20200411180224.GO29898@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philippe, All,

On 2020-04-11 09:41 -0400, Philippe Proulx spake thusly:
> On Sat, Apr 11, 2020 at 4:39 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > On Sat, 11 Apr 2020 10:12:32 +0200
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > People (and scritps) who want to report on the build progress, now know
> > > where and what to look for (build directory and stampfiles), but they
> > > also need to know the ordering of those stampfiles.
> > >
> > > The stampfiles item is a dictionary; dictionaries are guaranteed to not
> > > be ordered, so even if we output the stampfiles in order, we can expect
> > > users of that dictionary to get them back in order.
> > >
> > > Expose the build steps in a list, which is guaranteed to be ordered.
> > >
> > > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > > Cc: Vadim Kochan <vadim4j@gmail.com>
> > > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > > Cc: Arnout Vandecappelle <arnout@mind.be>
> > > Cc: eeppeliteloop at gmail.com
> > > ---
> > >  package/pkg-utils.mk | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> >
> > Meh, just like PATCH 6/8, I'm not sure. This is going to be a lot of
> > additional information in the JSON, almost duplicated for every
> > package, and there is really nothing bad in the "progress showing" tool
> > to have knowledge about these steps. It's not like they are changing
> > all the time.
> 
> Replying for patch 6/8 and this one.
> 
> Is the `show-info` target considered a public API?

Somewhat, yes. We can't guaraenntee its stability, though. If there are
keys that no longer make sense, then we would no longer be able to
expose them. Ditto, if a key semantics were to change, we would have to
reflect that in show-info.

For the former case, whem/if we eventually merge target/ and staging/
into one (or rather, we derive target/ from staging/) then there would
be no point in reportign the two, as they would both be always true, so
we would only need to keep "install_target" and "install_images"
(obviously we could have a transition period during which we still
report "isntall_staging", but it would be slated for removal long term).

For the latter case, if we eventually have a way to express the licenses
in a format more complex that jsut the list of licenses, then the
"licenses" key would have to evolve from a simple string to a more
complex object.

(Note: the above is just two hypotetical examples, the first being still
probable medium-term.)

> If so, without a
> version, it means it can never break.

I disagree: we can't guarantee its stability. We can make it as stable
as possible, but we can't leave it in stone. Probably what's going to
happen is that old keys will stay for as long as they still exist, and
only new stuff will be added. But when something no longer exist, we
won't be able to expose it anymore...

So, I am totally fine with breaking the output of show-info when we
can't do otherwise.

> So let me suggest another layout
> which breaks `show-info` (name it `show-info-2` if you will).
> 
> Output example (using YAML only for clarity here):
> 
>     version: 2
>     build_steps:
>       target:
>         - name: download
>           stamp_file: .stamp_downloaded
>         - name: extract
>           stamp_file: .stamp_extracted
>         - name: patch
>           stamp_file: .stamp_patched
>         - name: build
>           stamp_file: .stamp_configured
>         - name: configure
>           stamp_file: .stamp_built
>         - name: install_staging
>           stamp_file: .stamp_staging_installed
>         - name: install_target
>           stamp_file: .stamp_target_installed
>         - name: install_image
>           stamp_file: .stamp_image_installed

What you're doing here is indirection; I don't like indirection.

By having the information directly in the nodes, it is readily
available; the data can be parsed as a stream, with little to no
memorisation.

With indirection, it means you have to memorise some data so it can be
reused later. With your example, it is very limited, indeed, but it
opens a can of worm: except for lists, json is not guaranteed to be
ordered, so there is no reason that we can expect the "build_steps"
definitions to be read before the rest, so we'd have to buffer the
entirety of show-info before we can even start doing anything with it.

[--SNIP--]
> * The root `packages` object contains the package information for each
>   package type.
>   Not strictly related to this patch or the previous one, but instead
>   of repeating the type in each object, you can just group packages
>   by type.
> 
> * For each package object, the `build_steps` array indicate what are the
>   build steps for this package.
>   Each item is the name of a build step in the corresponding root
>   `build_steps` object's array.
> 
> * For a target package, the `install_staging`, `install_target`, and
>   `install_images` entries are removed.
>   They are not needed anymore because `build_steps` offers the same
>   information.
>   I understand some build steps could be implicit and not listed here,
>   but with my suggestion, you already have what's needed for any build
>   monitoring tool to watch a specific package build process if:
> 
>   * Some of the implicit build steps become optional in the future for
>     any reason that you don't know now.
> 
>   * You add new types of build steps: simply describe them in the
>     `build_steps` root arrays.
> 
>   Both scenarios won't require an API version bump.

As I understand your proposal, your tool would not have to hard-code the
build steps, because they would defined globally, and each package would
reference (in an ordered list0 the steps that apply to it.

Well, no need to define the steps globally, since you already have the
information at the package level: just construct the build sequence for
that package from the build steps listed in that package.

> If you're not willing to break `show-info` and don't want `show-info-2`,
> then you can:
> 
> * Keep `show-info` as is:
>   * Augment a package information with `build_steps` (like above).
>   * Keep the `install_*` entries which become redundant.

That's exactly what I did: I just augment show-info with new
informnation. leaving the legacy install{target,staging,images} keys in
place for those that used to use them.

> * Have another make target, say `show-build-steps`, which only prints
>   the root `build_steps` object above.
> What do you think?

I don't like indirection. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
