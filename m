From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 22:08:49 +0100
Subject: [Buildroot] potential divide by zero in
 support/scripts/size-stats
In-Reply-To: <CAAkeqgUXF5eVOjQEUkM0OARw+cvMxGG-REv2rw-3BRu9y-yz0A@mail.gmail.com>
References: <CAAkeqgUXF5eVOjQEUkM0OARw+cvMxGG-REv2rw-3BRu9y-yz0A@mail.gmail.com>
Message-ID: <20171127220849.5f62e6fc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Nov 2017 18:17:36 -0800, Andrey Yurovsky wrote:
> I see a divide by zero exception in support/scripts/size-stats when I
> use the graph-size target, the package of size zero causing this is
> skeleton-init-systemd which I worked out by catching the exception. Is
> this package erroneously of size zero or should that be OK?

Thanks for reporting this bug and proposing a fix! I have some comments
on the implementation, but first about the format: the commit log
should contain a Signed-off-by line with your name and e-mail, and the
commit log should not be formatted as a personal message, but rather as
a description of what is being changed/fixed. Also the first line
should look like: "support/scripts/size-stats: ..."

> diff --git a/support/scripts/size-stats b/support/scripts/size-stats
> index af45000..3cd6838 100755
> --- a/support/scripts/size-stats
> +++ b/support/scripts/size-stats
> @@ -178,9 +178,12 @@ def gen_files_csv(filesdict, pkgsizes, outputf):
>                       "File size in system (%)"])
>          for f, (pkgname, filesize) in filesdict.items():
>              pkgsize = pkgsizes[pkgname]
> -            wr.writerow([f, pkgname, filesize, pkgsize,
> -                         "%.1f" % (float(filesize) / pkgsize * 100),
> -                         "%.1f" % (float(filesize) / total * 100)])
> +            try:
> +                wr.writerow([f, pkgname, filesize, pkgsize,
> +                        "%.1f" % (float(filesize) / pkgsize * 100),
> +                        "%.1f" % (float(filesize) / total * 100)])
> +            except ZeroDivisionError:
> +                print('WARNING: \"%s\" is size 0!' % pkgname)

I don't think we want to skip files from zero-sized packages: we want
to see them in the CSV. So perhaps something like:

		if pkgsize != 0:
			percent_pkg = float(filesize) / pkgsize * 100
		else:
			percent_pkg = 0

		percent_total = float(filesize) / total * 100

		wr.writerow([f, pkgname, filesize, pkgsize,
			     "%.1f" % percent_pkg,
			     "%.1f" % percent_total])

Could you test it, and resubmit as a new patch, with your Signed-off-by?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
