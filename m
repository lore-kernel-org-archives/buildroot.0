From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Nov 2017 19:00:20 +0100
Subject: [Buildroot] BR2_REPRODUCIBLE issues
In-Reply-To: <ce053465-f273-fd04-2627-84bd438f6117@mind.be>
References: <1509720041684-0.post@n4.nabble.com>
 <87y3nn3yq6.fsf@dell.be.48ers.dk>
 <5c52008b-1ffa-7260-8681-5abeecd09665@mind.be>
 <20171105084630.GF2996@scaer>
 <CABhNV22jMFZdR8mp4ss_21XPmt2r8GmcLoahdn48_HsM9+RTpQ@mail.gmail.com>
 <20171106175012.GA2763@scaer>
 <ce053465-f273-fd04-2627-84bd438f6117@mind.be>
Message-ID: <20171108180020.GC4602@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-11-06 23:50 +0100, Arnout Vandecappelle spake thusly:
> On 06-11-17 18:50, Yann E. MORIN wrote:
> > Einar, All,
> > 
> > On 2017-11-06 10:43 +0100, Einar J?n spake thusly:
> >> On 5 November 2017 at 09:46, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >>> I still fail to see what is wrong with the current situation...
> >>
> >> The point is that you currently have close to 1900 packages. Most
> >> commits only changes 1 package.
> >> So you have 1899 packages with the exact same source code, but they
> >> produce different binaries because someone changed the 1900th package.
> >> Some people see that as an issue.
> > 
> > But you usually have no way, Buildroot-wise, to know that a change in a
> > package has no impact on other packages.
> [snip good explanation of how this can happen]
> > So we do really want to have SOURCE_DATE_EPOCH, *as exported by Buildroot*,
> > to contain the date of the last git commit, because that is what makes
> > sense: the whole recipe has changed, because one of its constituent has
> > changed, so the result as a whole will change.
> 
>  ... except that SOURCE_DATE_EPOCH is NOT a 'hash' or identifier of the
> reproducible build. On the contrary, it is just there to make sure that two
> builds *of the same configuration* at different times will give the same
> binaries. If the configuration is different, then the binaries will be different
> whatever the value of SOURCE_DATE_EPOCH.

Yes... I never said anything implying that given an S.D.E, one could
ensure reproducibility of binaries across configurations, no.

Reproducibility is only guaranteed when all the follwing conditions are
met:
  - a given Buildroot tree
  - a given set of packages
  - a given S.D.E.
  - probably quite a few other factors (like the path and user)

If you change a package version, then nothing can guarantee the
reproducibility of that package, obviously, but I argue that it is not
even possible to guarantee the reproducibility of other packages,
especially those that depend on the changed package.

Thus, if S.D.E. has to point at a specific time, it shall be the one
when the package was updated.

Now, if a specific use case, like the one for Einar, works by setting a
constant S.D.E, that is no longer the responsibility of Buildroot to set
S.D.E., especially since we now abide by the spec to not override it if
already set.

>  So really, we could just set SOURCE_DATE_EPOCH to 0 (1 Jan 1970) and be done
> with it. The only reason to have a "reasonable" value of SOURCE_DATE_EPOCH is
> that __DATE__ and __TIME__ expand to somewhat meaningful values.

Ah, did you mean that we could just fake a constant forever and be done
with it?

No we can't use '0', because some packages will detect that the date is
uterly wrong, too long in the past, and will refuse to work at all.

And any other arbitrary value is no better than the actual last source
change.

>  It would be an entirely different story if we would start using
> BR2_VERSION_GIT_EPOCH as a kind of version marker to be able to reuse a
> previously built tarball of the per-package SDK-and-target directories. But
> we're not quite there yet :-)

And we will not go that route, because that would mean we are doing
binary packages, which is *way* more complex that just looking at the
date. ;-)

But for Buildroot, we do really want to set S.D.E. to a meaningful
value, yes. And that value is the time of the last change of the
Buildroot source tree as a whole.

Yes, the spec does not madate that it is; it only says 'should'. But it
does not make sense, from the Buildroot point of view, to set it to
anything else...

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
