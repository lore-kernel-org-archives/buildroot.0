From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 15:25:08 +0100
Subject: [Buildroot] [PATCH v2 2/2] support/scripts: add
 size-stats-compare script
In-Reply-To: <1453207433-32589-2-git-send-email-patrickdepinguin@gmail.com>
References: <1453207433-32589-1-git-send-email-patrickdepinguin@gmail.com>
 <1453207433-32589-2-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160201152508.45575c43@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, 19 Jan 2016 13:43:53 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Leverage the CSV files produces by size-stats (make graph-size) to allow
> for a comparison of rootfs size between two different buildroot
> compilations.
> 
> The script takes the file-size CSV files of two compilations as input, and
> produces a textual report of the differences per package.
> Using the -d/--detail flag, the report will show the file size changes
> instead of package size changes.
> The -t/--threshold option allows to ignore file size differences smaller
> or equal than the given threshold (in bytes).
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  docs/manual/common-usage.txt       |  10 +++
>  support/scripts/size-stats-compare | 129 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 139 insertions(+)
>  create mode 100755 support/scripts/size-stats-compare

I tested your patch, overall looks good to me, but I have two comments:

 (1) I find the order of the arguments for the two CSV files to be
     confusing. If you have a "before" situation, and then an "after"
     situation you want to compare, you need to call:

        size-stats-compare after-situation.csv before-situation.csv

     Which isn't very intuitive nor matching what "diff" is doing for
     example. So I would suggest to invert those two arguments. And in
     the code, instead of having "sizes" and "other_sizes", use
     something more explicit like "before_sizes", "after_sizes", or
     "first_sizes", "second_sizes", etc.

 (2) For the output, I would rather see a single table, maybe looking
     more or less like:

     1032987         foobar
      289792 added   strace
       65576         busybox
           0         skeleton
           0         toolchain-external
           0         initscripts
      -68692 removed zlib
	---- -----   -----
      292908         TOTAL


     (Numbers are completely made up)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
