From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 21:42:57 +0200
Subject: [Buildroot] [PATCH] autobuild-run: remove only tarballs from
 download dir
In-Reply-To: <20180413133431.19449-1-ricardo.martincoski@gmail.com>
References: <20180413133431.19449-1-ricardo.martincoski@gmail.com>
Message-ID: <20180415214257.1e90704a@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Apr 2018 10:34:31 -0300, Ricardo Martincoski wrote:

> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 33d0ae9..6a01151 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -291,6 +291,9 @@ def prepare_build(**kwargs):
>      # recursively find files under root
>      def find_files(root):
>          for r, d, f in os.walk(root):
> +            if '.git' in d:
> +                d[:] = list()
> +                continue

Just to check how this is supposed to work. We have this:

 dl/<package>/git/.git

Correct ?

So you're idea is that when we are inside dl/<package>/git/, one of the
sub-directories is .git, and therefore we shouldn't remove anything in
dl/<package>/git/ ?

My concern is that I'm not sure if what you've done prevents from
removing files inside dl/<package>/git or only inside
dl/<package>/git/.git. I would find it more to do something like:

	if "git" in d:
		d.remove("git")

but perhaps you haven't done this for some good reason ?

Another concern is how to fix those autobuilders that have already
removed some random files from their cached Git repositories? Should we
ask the people who run those autobuilders to entirely wipe the download
folders of their autobuilder instances ? Or do we have a smart (but
simple) thing to do to avoid this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
