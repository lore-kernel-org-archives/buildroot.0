From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Aug 2020 21:22:31 +0200
Subject: [Buildroot] [PATCH v3 06/10] package/pkg-cargo.mk: Introduce
 the cargo dl backend
In-Reply-To: <20200220160119.3407-6-patrick.havelange@essensium.com>
References: <20200220160119.3407-1-patrick.havelange@essensium.com>
 <20200220160119.3407-6-patrick.havelange@essensium.com>
Message-ID: <20200826212231.19aef9e2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Feb 2020 17:01:15 +0100
Patrick Havelange <patrick.havelange@essensium.com> wrote:

> Cargo is now a fully supported PKGMGR, automatically set for any
> package using the cargo infrastructure.
> This effectively splits the download phase and the build phase.
> 
> The cargo backend will set CARGO_HOME inside DL_DIR during download.
> The cached files in CARGO_HOME permits to download only once the
> crates index and each dependencies.
> During download phase, it will call cargo vendor to copy the
> dependencies inside the VENDOR directory inside the source archive.
> 
> A local cargo config is also inserted inside the archive in order
> to use the VENDOR dir during the build phase.
> The build phase is forced to not query the online repository anymore
> and thus will be using the vendored dependencies from the tarball.
> This also permits to have offline builds.
> 
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

We looked at this patch series during the previous (virtual) Buildroot
Developers Meeting in late July, and we forgot to give some feedback.
I'll provide the raw IRC logs of the discussion we had, however, I see
there's been more discussion tonight on the IRC channel on this topic.

[13:54:34] <kos_tom> wow, wow this series https://patchwork.ozlabs.org/project/buildroot/list/?series=159771 has some pretty weird download infrastructure changes
[13:55:17] <y_morin> Yes, it scares me quite a bit...
[13:55:33] <y_morin> However, I think we already discussed that here some time ago.
[13:55:52] <y_morin> The proposal I did was:
[13:56:19] <y_morin> 1) introduce a cargo download backend
[13:56:47] <y_morin> 2) have the cargo backend call the real backend (git, wget, etc...) for the cargo package,
[13:57:21] <y_morin> 3) have the cargo backend call "cargo bundle" to complete the package archive.
[13:57:26] <y_morin> kos_tom: ^^^
[13:59:50] <kos_tom> y_morin: I'm not sure how the "cargo backend can call the real backend
[14:00:10] <kos_tom> y_morin: what the patch series does is call "cargo vendor" to download all the dependencies
[14:00:34] <kos_tom> and then it makes a tarball of the whole thing, i.e the actual package source code + all its cargo dependencies
[14:00:48] <kos_tom> and that's what you get as a tarball for this package in DL_DIR
[14:01:09] <y_morin> kos_tom: It is easy for the cargo backend to call the adequate "real" backend:  "${0%/*}/wget"
[14:01:30] <y_morin> We "just" need to be able to pass that info yto he cargo backend
[14:01:32] <kos_tom> y_morin: the cargo backend does not do the download of dependecnies by itself
[14:01:37] <kos_tom> it calls the "cargo vendor" command
[14:01:55] <y_morin> kos_tom: I don;t yet care about the depdnencies. I care about the main download for now.
[14:02:15] <y_morin> kos_tom: Hold on a sec, I'll post a simple script that shows that...
[14:02:46] <kos_tom> y_morin: look at the patch series
[14:02:52] <kos_tom> y_morin: it does use *two* backends
[14:02:56] <kos_tom> it uses the normal backend for the main download
[14:03:04] <y_morin> kos_tom: I know.
[14:03:08] <kos_tom> + an extra secondary backend, called "cargo" to download the dependencis
[14:03:11] <y_morin> And I am not OK with that.
[14:03:23] <y_morin> I am propiosing something else.
[14:03:40] <y_morin> I.e. to invert the logic
[14:03:48] <kos_tom> yeah, you are proposing that the "cargo" backend takes care of both the main download and the dependencies download
[14:03:57] <kos_tom> and not have this concept of "secondary backend"
[14:04:02] <y_morin> Exactly.
[14:04:05] <kos_tom> Ok.
[14:04:15] <kos_tom> the question is: do we want this kind of download integration at all?
[14:04:22] <kos_tom> if we do, does it work for NodeJS ? PHP ?
[14:05:40] <y_morin> kos_tom: https://pastebin.com/c3K42Lb7
[14:06:03] <y_morin> kos_tom: That is also the idea. For go, it would be very similar too.
[14:06:19] <kos_tom> y_morin: but how do you pass the "real backend" if the backend is "cargo" ?
[14:06:22] <y_morin> And for npm and php, afaiu (which is not much), as well
[14:06:28] <kos_tom> i.e if you have a cargo package to fetch from Git, and another from https
[14:07:06] <y_morin> kos_tom: Pretty east. In the cargo infra:    FOO_SITE_METHOD = cargo  FOO_EXTRA_DLOPTS += --backend=$(whatever)
[14:07:22] <y_morin> kos_tom: Hmm...
[14:07:39] <y_morin> you mean "cargo vendor" can fetch from various locations?
[14:08:07] <y_morin> I meant: from various location usign various methods?
[14:08:21] <y_morin> It that is so, then my proposal is not good, indeed.
[14:08:55] <kos_tom> y_morin: no I meant the primary download
[14:09:11] <kos_tom> y_morin: ie. for the ripgrep package, the actual download of the ripgrep code
[14:09:44] <kos_tom> of the cargo series, I'm wondering if I should apply patches 1/2/3, which create the package infra, but not the download stuff
[14:09:53] <y_morin> kos_tom: Ah, but the primary download is exactly that: FOO_EXTRA_DLOPTS += --backend=$(geturischeme $(FOO_SITE))
[14:10:08] <kos_tom> my main concern is that we have a single package that would use this infra right now, which doesn't make merging such a simple infra very convincing.
[14:10:30] <kos_tom> y_morin: instead of an extra backend, can we do with a post-download hook ?
[14:10:54] <y_morin> kos_tom: I had a good reason not to use such a hook.
[14:11:06] <y_morin> kos_tom: I would have to dig my irc logs...
[14:11:54] <y_morin> kos_tom: Ah yes, I know...
[14:12:19] <y_morin> kos_tom: If you use a post-dl hook, it means the archive with just the main package is already in $(FOO_DL_DIR)
[15:12:14] <kos_tom> y_morin: so can we try to conclude on the cargo download thing?
[15:13:08] <y_morin> kos_tom: I provided some info above, not sure you saw it...
[15:13:29] <y_morin> kos_tom: If you use a post-dl hook, it means the archive with just the main package is already in $(FOO_DL_DIR)
[15:13:47] <kos_tom> y_morin: but is that a problem ?
[15:14:00] <kos_tom> I guess it is indeed simpler to have a single tarball that has the source code for everything, including dependencies
[15:14:05] <y_morin> kos_tom: Yes it is, for a subsequent build: it would not match the hashes.
[15:14:35] <kos_tom> are the hashes anyway going to match when you see (from the "bat" example being discussed with Romain) that dependency versions anyway can change
[15:14:40] <y_morin> kos_tom: That is the idea that the archive contains the main package *and* all its depednencies.
[15:14:56] <y_morin> For those package managers that allow pinning the version, we can get hashes of the archive, then

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
