From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Nov 2016 00:02:19 +0100
Subject: [Buildroot] pseudo: remaining issues...
In-Reply-To: <20161122212534.GA3529@free.fr>
References: <20161122212534.GA3529@free.fr>
Message-ID: <315eabd4-eb7f-2e83-c8f8-caa5a3cd3099@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-11-16 22:25, Yann E. MORIN wrote:
> One solution that would make it work in all cases would be:
> 
>   - do the target-finalize actions in a copy of target/
>   - generate, filesystem images form that copy
>   - trash the copy
>   - trash pseudo DB

 This could fit pretty well in a per-package-staging like approach (but then per
package target, obviously). So each package installs in its own version of the
target directory, and at the end everything is put together into the final
target. The latter can be done under pseudo.

 BTW, it's not really needed to repeat all the makedevs etc. steps under pseudo
for every filesystem, we could just do that once, and then generate each
filesystem (under pseudo again of course). But that doesn't fix the issues with
rebuilding, of course.


> Another possibility would be to always do changes in target/ under
> pseudo:
>   - installing packages
>   - taget-finalize
>   - filesystem generation

 I think this option is where we want to go long-term. Packages are meant to be
installed under sudo, so installing them under pseudo is a good idea.

 It's not so trivial for us, though. In openembedded they can easily do the
equivalent of install-target under pseudo, but we can't because the commands run
under individual shells in make. There are a few possibilities to work around
that, but it needs some thinking.

> Neither solution is trivial, especially so close to the release.
> 
> 
> Alternatively, we can revert back to using fakeroot for this release, at
> the expense of breaking (already previously broken) setups with SELinux
> on the host.

 It looks like that will be the way to go :-(

 Note that we'll also need to revert c85cd189dc1d (as discussed on IRC), because
of the /dev/console thing you described. That used to work under fakeroot
because the mknod() was done even if the (normal) file existed already, but with
c85cd189dc1d it won't work anymore under fakeroot (because there we don't store
the database).


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
