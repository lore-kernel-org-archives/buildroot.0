From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2021 11:23:12 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: properly
 handle host packages with -c option
In-Reply-To: <20210131214120.170C981562@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 31 Jan 2021 23:01:21 +0100")
References: <20210131214120.170C981562@busybox.osuosl.org>
Message-ID: <87mtwonl2n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=c9a1a1eb91420e8718185e8e1d076639e552472b
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > In commit 7a607dab336e7f78ab069cff1b503d0688950583
 > ("support/scripts/pkg-stats: support generating stats based on
 > configured packages"), we added a -c option to pkg-stats to generate a
 > report based on the list of packages enabled in the configuration,
 > rather than for all packages.

 > This is done based on the list of packages returned in JSON format by
 > "make show-info". However, we use the keys of the JSON dict returned
 > by "make show-info", which include the host- prefix of host
 > packages. Due to this, none of the host packages are currently
 > matching and therefore they are not reported in the pkg-stats -c
 > output.

 > This commit fixes that by using the recently introduced "name"
 > property in the "make show-info" JSON dict.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > [yann.morin.1998 at free.fr: use anonymous '_' for unused variable]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---
 >  support/scripts/pkg-stats | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
 > index d222ba37c3..f58afc02ae 100755
 > --- a/support/scripts/pkg-stats
 > +++ b/support/scripts/pkg-stats
 > @@ -358,7 +358,7 @@ def get_pkglist(npackages, package_list):
 >  def get_config_packages():
 >      cmd = ["make", "--no-print-directory", "show-info"]
 >      js = json.loads(subprocess.check_output(cmd))
 > -    return js.keys()
 > +    return set([v["name"] for _, v in js.items()])

If we don't care about the key at all, why not just use js.values()?

-- 
Bye, Peter Korsgaard
