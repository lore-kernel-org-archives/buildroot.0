From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 11:05:07 +0200
Subject: [Buildroot] [PATCH v2] qt5webengine: propagate parallel flag to
 ninja
In-Reply-To: <20180629143521.9018-1-gael.portay@savoirfairelinux.com>
References: <20180629143521.9018-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180701110507.0c0eed41@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jun 2018 10:35:21 -0400, Ga?l PORTAY wrote:
> WebEngine is a big project to build. It uses ninja which is a build
> system that does everything in parallel[1].
> 
> 	Builds are always run in parallel, based by default on the number of
> 	CPUs your system has. Underspecified build dependencies will result in
> 	incorrect builds.
> 
> QtWebEngine does not propagate the parallel flag from the running
> instance of make to ninja. Thus, all the machine cores are used to build
> this single project.
> 
> 	make -j 10 -> ninja -j # all cores
> 
> This behavior disrupts powerful machines which are setup to build many
> projects in parallel. Even worse, the build fails on machines where the
> ratio CPU-cores / amount of RAM (including swap) is not appropriate. g++
> may have not enough of memory to build all those files in parallel.
> 
> Unfortunatly, the target `run_ninja' is hardcoded in the Makefile
> src/core/Makefile.run_gn; there is no way to propagate flags using a
> variable through the make command-line.
> 
> 	run_ninja:
> 	        /home/gportay/src/buildroot/output-qt5.11/build/qt5webengine-5.11.1/src/3rdparty/ninja/ninja
> -C /home/gportay/src/buildroot/output-qt5.11/build/qt5webengine-5.11.1/src/core/release QtWebEngineCore
> 
> Luckily, the Qt gn_run.pro[2] can hardcode ninja extra flags through the
> variable NINJAFLAGS when the Makefile is generated (which is performed
> during the build and not during configure step).
> 
> This commit sets the NINJAFLAGS using the variable PARALLEL_JOBS to limit
> the number of cores used by ninja.
> 
> Fixes:
> 	virtual memory exhausted: Cannot allocate memory
> 
> [1]: https://ninja-build.org/manual.html#_comparison_to_make
> [2]: https://github.com/qt/qtwebengine/blob/v5.11.1/src/core/gn_run.pro#L49-L53
> 
> CC: Damien Riegel <damien.riegel@savoirfairelinux.com>
> CC: Jean-Fran?ois T?tu <jean-francois.tetu@savoirfairelinux.com>
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
> Changes since v1:
>  - Use PARALLEL_JOBS instead of BR2_JLEVEL
>  - Reword commit message

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
