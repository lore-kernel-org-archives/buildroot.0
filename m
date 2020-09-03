From: Christian Stewart <christian@paral.in>
Date: Thu, 3 Sep 2020 12:40:23 -0700
Subject: [Buildroot] [RFC PATCH v1 1/1] package/pkg-golang: download
 deps to vendor tree if not present
In-Reply-To: <20200903191841.GC14354@scaer>
References: <20200831062335.1105977-1-christian@paral.in>
 <20200831070800.GN14354@scaer>
 <CAK714xKp0H5HEv5bp1bjDumZff6+cC41cs=exZk8bKuZTCV2vQ@mail.gmail.com>
 <20200903132852.GZ14354@scaer> <20200903160205.7e67bbe7@windsurf.home>
 <20200903151221.GA14354@scaer> <20200903181334.1a25642b@windsurf.home>
 <20200903191841.GC14354@scaer>
Message-ID: <CA+h8R2rNmRJUor9CDjyNzsgGPCmpE3XPjtkFdjzCeMGYenWKxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Thu, Sep 3, 2020 at 12:19 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Something the go/cargo/npm/composer/... folkds would have to answer. And
> if at all, I;d like that we get a consistent behaviour across all those
> package managers that have vendoring of dependencies. Indeed, it would
> be very disapointing to have one support it and nto the others. I.e. if
> we can't do separate tarball for one of them, we should not do for the
> others...

I do not see in any way how this would not be possible, even for npm,
you can quite easily query the package dependency graph and set things
up properly.

> For example, let's say that Joe Developer Jr. in BIG CORP copies some
> LGPL-licensed code into their proprietary project, as a bundled library.
>
> This is totally legit: the proprietary parts are not tainted (I hate
> that word, but have not better for now) by the LGPL stuff. Yet, they
> have to redistribute the LGPL stuff.
>
> Buildroot currently offers noway for them to do that.

In what world would a Buildroot package ever be added as an in-tree
package with a proprietary library *copied into the source code tree*
??

> Vendoring is the same as bundling, except it happens at download time on
> our side, not on the upstream developper's machine.

We're enforcing hash checks on these bundles. The format may not
always be the same across versions. Storing the source code before
it's extracted into a vendor tree is the only way to be sure that the
hashes won't change between iterations of the package manager. It's
also the only way to redistribute the source code packages for the
libraries independently from the proprietary part, maintaining the
hashes. It's the only way to deduplicate downloads of identical
package versions, to do LICENSE checks on dependencies, etc etc etc.

I don't see an alternative option here. Just running the package
manager and compressing the result is less convincing than writing
some code to properly understand each dependency.

> > >   - at extract step, how do you know that you have to also extract the
> > >     archive with the vendor stuff? Probably easy by looking if said
> > >     archive exists. But then, if each dependency is stored in its own
> > >     archive, how do you know which to extract?

 - Extract the main package
 - Check the package.json or go.mod or cargo or whatever
 - Extract the relevant stuff into a format the package manager understands
 - Run the package manager from the language to assemble the "vendor"
tree in the source dir (maybe same step).

> > You would parse the go.mod file I suppose, but that doesn't give you
> > indirect dependencies. Perhaps some Go tool can help with that ? But
> > indeed, that's a good question.

?? go.mod handles indirect dependencies.

> And what about cargo? npm? php composer? Others? (what, there are
> others? ;-] )

package.lock yarn.lock. Require it.

> > Note that storing each dependency as a separate tarball was an idea I
> > have thrown on the table, not something that was proposed by Sam.
>
> Yes, but one or many, it does not change much...

It changes a lot! As described above.

> > > And then, if two deps at
> > >     different levels have a depednency on another package, but at
> > >     different versions?
> > I am not following you on this one.
>
>   - foo vendors libssl version 42.27
>   - foo vendors libhttp version 1.2.3
>     - libhttp 1.2.3 vendors libssl 666.777
>
> What version of libssl do we extract where?
>
> I do not want to have to repeat the vendoring logic in Buildroot.

Why repeat it? Re-use it from the programming language! Not everything
has to be in bash.

> Also, I do not want that we have various level of vendoring support for
> the various package managers.

OK, so we implement it across the board, which language would not be
able to support this?

> > >   - when you generate the legal-info/ directory, how do you know what to
> > >     put in there for that package? You are back to the problem above,
> > >     plus you would also want to ignore those vendored deps that are not
> > >     redistributable, although we have no way in Buildroot to describe
> > >     that either....

Use the license field in the package.json or wherever the specifiers
exist, and if they aren't there, detect common LICENSE file names, if
you can't find anything, fail.

Go has a few very robust license detector packages. (if desired).

> So, if we jut concentrate on how we can help people do exactly that:
> filter out the bits they do not want to redistribute?
>
> One solution would be to have packages provide some legal-inf hooks,
> something like (e.g.: only keep files which names match the regexp):
>
>     FOO_LEGAL_INFO_FILTER_REGEXP = ^vendor/FLOSS/
>
> Or whatever, that would be applied at the time the legal-info is
> generated.

How does this solve the problem? If I need to give the source tarballs
away for dependencies, and it's all mixed into one massive tarball,
you can't separate things out and keep the hashes the same

I thought the requirement was that you would be able to send someone
the buildroot "dl" directory and be able to perform a build without
network fetches.

> Paint me unconvinced.

What's the alternative?

> Regards,
> Yann E. MORIN.


best regards,
Christian Stewart
