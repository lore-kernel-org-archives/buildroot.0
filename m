From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 23:31:53 +0100
Subject: [Buildroot] [PATCH 3/5] package/pseudo: wrap the real pseudo
 with a wrapper
In-Reply-To: <17a63de5fc6ed262263e054776a1bac481701b42.1478643505.git.yann.morin.1998@free.fr>
References: <cover.1478643505.git.yann.morin.1998@free.fr>
 <17a63de5fc6ed262263e054776a1bac481701b42.1478643505.git.yann.morin.1998@free.fr>
Message-ID: <20161109233153.6c4775a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 Nov 2016 23:18:33 +0100, Yann E. MORIN wrote:
> Running pseudo is more involved than running fakeroot. In the transition
> from using fakeroot, we just did not account for the extra requirements.
> 
> First, we explicitly tell pseudo where it is, otherwise it tries to
> guess. Its guess is correct, but it prints a warning, which is not nice.
> 
> Second, we tell it where to find the passwd and group files in case it
> has to emulate access to them. We currently do not use that feature, but
> better safe than sorry.
> 
> Third, pseudo spawns a background daemon, and talks to it (when fakeroot
> would emulate the state all in the current process' state, pseudo uses
> the daemon to coordinate the state across multiple processes). We are
> not much interested in the daemon lingering around, so we just tell it
> to terminate as soon as the last clients quits (this can take up to one
> second).
> 
> Fourth and last, pseudo always stores its internal database when
> exiting, and reloads it when spawned. The database is by default stored
> in a sub-directory of the prefix it was installed in, but this is
> impractical for us. We want the database to be specific to the one
> config dir we are building, so we store the database in a (hidden)
> sub-dir of the build dir, thus ensuring it is never shared with another
> build. That directory is hidden (starts with a dot) because we consider
> that to be our internal state that we do not want to expose to the user.
> 
> The wrapper has to be relocatable, so we avoid using hard-coded paths
> in there: we derive those paths fom the runtime path of pseudo. However,
> the build directory $(BUILD_DIR) is not available in the environment
> (we do not export it because it conflicts with some buildsystems).
> Instead, we use $(BASE_DIR) which is exported.
> 
> Finally, when relocated, the wrapper would not be used in the Buildroot
> environment, so may not have access to TARGET_DIR or BASE_DIR, unless
> the user sets them. If he does not, we still want the wrapper to be
> working (to avoid the warning about the prefix, and to exit the daemon
> asap); thus we leave the passwd and localstatedir variable alone if we
> don't have what it needs to set them, rather than set them to incorrect
> values.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
> Cc: Erico Nunes <nunes.erico@gmail.com>
> Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> Changes v1 -> v2:
>   - do not use a variable, but use a wrapper
> ---
>  package/pseudo/pseudo-wrapper | 12 ++++++++++++
>  package/pseudo/pseudo.mk      |  6 ++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/pseudo/pseudo-wrapper

Patches to 3 to 5 applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
