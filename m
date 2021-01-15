From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Jan 2021 11:27:36 +0100
Subject: [Buildroot] [PATCH 1/2] core: add
 BR2_PRIMARY_SITE_ONLY_EXTENDED_DOMAINS
In-Reply-To: <20210102220725.GI2997@scaer>
References: <20201204123313.14455-1-patrickdepinguin@gmail.com>
 <20210102220725.GI2997@scaer>
Message-ID: <CAAXf6LXSQ7KwP64rDPkpgDsF5ZeCKbp_j2x-BeLyB7jroTJ_yQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

Sorry for the delay in answering.

El s?b, 2 ene 2021 a las 23:07, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Thomas, All,
>
> On 2020-12-04 13:33 +0100, Thomas De Schampheleire spake thusly:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > If configured, the primary site typically points to a mirror on the intranet
> > of an organization. The purpose of BR2_PRIMARY_SITE_ONLY is then to only
> > download from this mirror.
> >
> > However, the organization may also have some local Buildroot packages
> > that download from a version control repository (git, hg, ...). In this case,
> > the mirror will normally not contain the sources, instead they should be
> > cloned via the version control tool. So in this case, BR2_PRIMARY_SITE_ONLY
> > cannot be used.
> >
> > This means that the organization must resort to other means to make sure no
> > external downloads are performed.
> >
> > This patch attempts to solve this situation by adding
> > BR2_PRIMARY_SITE_ONLY_EXTENDED_DOMAINS. This string option can contain
> > additional domains from which download is allowed when BR2_PRIMARY_SITE_ONLY
> > is set.
> >
> > The organization can thus set:
> > BR2_PRIMARY_SITE_ONLY=y
> > BR2_PRIMARY_SITE_ONLY_EXTENDED_DOMAINS="git.example.com hg.example.com"
>
> BR2_PRIMRAY_SITE_ONLY_ALLOWED_DOMAINS would be more meaningful, I
> think...
>
> > to disallow any external downloads other than the primary site and the
> > mentioned version control domains.
> >
> > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> Although I do understand the issue, and I do agree that this is a sane
> policy to not rely on external resources in such a situation, I still
> think this is pushing the boundaries a bit on Buildroot...
>
> First, there would be nothing that would prevent a local user to enter
> menuconfig and set this to whatever they want, or to simply disable
> primary-only. So, an option such as BR2_PRIMRAY_SITE_ONLY_ALLOWED_DOMAINS
> would not cater to local users on their development machines.
>
> So, we're left with automated builds, running in a CI. In this case, the
> environment is much more controlled, and I think this is where such a
> limitation should take place. The CI system should not be able to reach
> out to the wider internet, and should be constrained to access local the
> network(s).
>
> For example, in the CI at $work, there are two steps:
>  1. make source, which has access only to the local network;
>  2. make, which does not have access to the network at all.
>
> Also, when considering the upcoming "package managers" (go, cargo,
> etc...), the filtering is way too early, and can't be applied to them.
> I.e. there is no way to tell (e.g.) cargo that a set of domains are
> allowed while others are not. So an option like you propose would only
> have a limited use, with un-pluggable holes hidden from sight, ready to
> trip users hard-time. A properly set-up CI system would however prevent
> those package managers from indeed reaching outside the company's
> network(s).
>
> So, no, I am very much not in favour of this new option...

BR2_PRIMARY_SITE_ONLY_ALLOWED_DOMAINS is merely an extension of
BR2_PRIMARY_SITE_ONLY, taking into account the fact that
BR2_PRIMARY_SITE_ONLY does not consider downloads from version control
systems, i.e. only assuming wget or scp from a fixed mirror.
I think your arguments, for example related to external package
managers, also apply to the existing BR2_PRIMARY_SITE_ONLY. So based
on these arguments alone, the conclusion would be to get rid of
BR2_PRIMARY_SITE_ONLY too.

In fact, even if the external network is (intentionally) not
accessible, just enabling BR2_PRIMARY_SITE_ONLY (possibly in
combination with BR2_PRIMARY_SITE_ONLY_ALLOWED_DOMAINS) will help with
making the logs more clear. Indeed, without it, absence of a certain
tarball on the primary mirror, will still result in download attempts
to the external network, which fails. Users that read the log, without
knowing much detail about the buildroot download mechanisms, then
conclude that there is a problem with the external download, instead
of realizing that the real problem is either connection to the mirror,
or absence of the package on that mirror.
(I'm not talking hypothetically here, I am faced with such behavior frequently).

So the option(s) to download only from a mirror have valid reasons to
exist IMHO.
The concerns about other download managers are also valid, but already
exists without these changes. And not all users actually use packages
of these types.

Best regards,
Thomas
