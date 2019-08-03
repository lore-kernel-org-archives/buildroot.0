From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 21:48:36 +0200
Subject: [Buildroot] [PATCH] autobuild-run: store summary if not
 uploading
In-Reply-To: <20190115213724.30311-1-arnout@mind.be>
References: <20190115213724.30311-1-arnout@mind.be>
Message-ID: <20190803214836.2574ed2b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Jan 2019 22:37:24 +0100
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 77272f5..c3b51bc 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -617,6 +617,10 @@ def send_results(result, **kwargs):
>              sha1 = hashlib.sha1(f.read()).hexdigest()
>          resultfilename = "instance-%d-%s.tar.bz2" % (kwargs['instance'], sha1)
>          os.rename(os.path.join(outputdir, "results.tar.bz2"), resultfilename)
> +        summaryfilename = "instance-%d-%s.summary" % (kwargs['instance'], sha1)
> +        reason = get_failure_reason() or ("",)
> +        with open(summaryfilename, 'wt') as f:
> +            f.write("%d,%s\n" % (result, ','.join(reason)))

The code changed a bit around this (kwargs has been replaced by class
members, the reason is already in a "reason" variable, so no need to
call get_failure_reason() again, etc.). I fixed this up, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
