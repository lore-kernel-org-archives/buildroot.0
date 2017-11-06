From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Nov 2017 18:50:12 +0100
Subject: [Buildroot] BR2_REPRODUCIBLE issues
In-Reply-To: <CABhNV22jMFZdR8mp4ss_21XPmt2r8GmcLoahdn48_HsM9+RTpQ@mail.gmail.com>
References: <1509720041684-0.post@n4.nabble.com>
 <87y3nn3yq6.fsf@dell.be.48ers.dk>
 <5c52008b-1ffa-7260-8681-5abeecd09665@mind.be>
 <20171105084630.GF2996@scaer>
 <CABhNV22jMFZdR8mp4ss_21XPmt2r8GmcLoahdn48_HsM9+RTpQ@mail.gmail.com>
Message-ID: <20171106175012.GA2763@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Einar, All,

On 2017-11-06 10:43 +0100, Einar J?n spake thusly:
> On 5 November 2017 at 09:46, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > I still fail to see what is wrong with the current situation...
> 
> The point is that you currently have close to 1900 packages. Most
> commits only changes 1 package.
> So you have 1899 packages with the exact same source code, but they
> produce different binaries because someone changed the 1900th package.
> Some people see that as an issue.

But you usually have no way, Buildroot-wise, to know that a change in a
package has no impact on other packages.

For example, is all you change is a library, and that library now
exposes an extra header that can then be detected by another package,
then that other package will have to be rebuilt because, although it is
the same source tree, the build of that package will be different
because it will see new features in that library.

And that is not theoretical: there are packages that do things like:

    checking for libfoo... yes
    checking if libfoo understand blabla... no

And that when you update libfoo, will now behave as:

    checking for libfoo... yes
    checking if libfoo understand blabla... yes

So, from Buildroot's point of view, and probably from most users' point
of view, it is impossible to know if changing one package will have an
impact on other packages.

So we do really want to have SOURCE_DATE_EPOCH, *as exported by Buildroot*,
to contain the date of the last git commit, because that is what makes
sense: the whole recipe has changed, because one of its constituent has
changed, so the result as a whole will change.

Now, that parts of the whole do not change is obviously correct, but then
it is so technically complex to *guarantee* a clean separation, that it
is nigh impossible.

> For example we have a setup where we want to update embedded devices
> in the field.
> The update should be as small as possible, so we take a diff of the
> target/ for baseline commit (that BR2_REPRODUCIBLE_CUSTOM_REPO_VERSION
> points to) and the new build.
> To fix a bug in a single tiny file that results in a 7.5MB update
> package if SOURCE_DATE_EPOCH keeps changing, but it can be below 4kb
> if the SOURCE_DATE_EPOCH is the same.

I do see your use case, and I do understand it: you basically want to do
partial upgrades of your system (for various reasons that are your own
right).

But Buildroot does not build packages like a distro, like OpenEmbedded
or like openWRT (or others) do.

Instead, Buildroot builds a complete rootfs; it is the atomic artefact
output by Buildroot. As such, what matters for Buildroot is the whole,
not the parts.

See also the manual, where we explain at length why we are not doing
binary packages, especially the last part about our position statement,
tangentially related to the explanation of your use-case:
    https://buildroot.org/downloads/manual/manual.html#faq-no-binary-packages

> But supplying the SOURCE_DATE_EPOCH from Jenkins is fine by me. So the
> fix is great.
> 
> I'll shut up now.

Sorry if you found my and the others' replies to imply that you should
"shut up". That was definitely not my intention, and I know Peter,
Arnout and Thomas enough to know that it was not theirs as well.

Your feedback was valuable; it just does not fit in the Buildroot way of
things.

Regards,
Yann E. MORIN.

> Thanks
> 
> >
> > Regards,
> > Yann E. MORIN.
> >
> >>  Regards,
> >>  Arnout
> >>
> >>
> >> --
> >> Arnout Vandecappelle                          arnout at mind be
> >> Senior Embedded Software Architect            +32-16-286500
> >> Essensium/Mind                                http://www.mind.be
> >> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> >> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> >> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'
> 
> 
> 
> -- 
> Regards
> Einar J?n
> +31 610 957234

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
