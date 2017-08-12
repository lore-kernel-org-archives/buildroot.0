From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Aug 2017 17:43:30 +0200
Subject: [Buildroot] [PATCH] autobuild-run: fix retrieving the gitid
In-Reply-To: <20170812094943.16460-1-yann.morin.1998@free.fr>
References: <20170812094943.16460-1-yann.morin.1998@free.fr>
Message-ID: <1c2b2347-3b34-ce6a-7e4b-30055fae81d3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-08-17 11:49, Yann E. MORIN wrote:
> Before 66f91eb (autobuild-run: add --repo option), we used to 'git pull'
> to update the local Buildroot clone. This had the side-effect of
> updating the local refs because we were pulling from 'origin'.
> 
> So 'origin/master' and 'master' were correctly updated.
> 
> But since the offending commit, we no longer pull, and we instead fetch
> from an explicit repository, which never updates 'origin/master' nor
> 'master'. Instead, they both are stuck at the time the repository was
> cloned, or at the time the autobuild script was updated.
> 
> We fix that by just dropping the 'master' ref from the git log so that
> the log applies to the commit for current working copy.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reported-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Also checked that there are no other similar oopses.

 For me it would make sense to produce this gitid file immediately after the
fetch, but that's a different story of course.

 Regards,
 Arnout

> ---
>  scripts/autobuild-run | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index ef4f40e..406b8e5 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -409,7 +409,7 @@ def send_results(result, **kwargs):
>          shutil.copyfile(os.path.join(outputdir, "legal-info", "manifest.csv"),
>                          os.path.join(resultdir, "licenses-manifest.csv"))
>  
> -    subprocess.call(["git log master -n 1 --pretty=format:%%H > %s" % \
> +    subprocess.call(["git log -n 1 --pretty=format:%%H > %s" % \
>                       os.path.join(resultdir, "gitid")],
>                      shell=True, cwd=srcdir)
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
