From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Jan 2016 13:51:56 +0100
Subject: [Buildroot] [PATCH] support/scripts: add size-stats-compare
	script
In-Reply-To: <56998EA7.5020603@mind.be>
References: <1452872492-6980-1-git-send-email-patrickdepinguin@gmail.com>
 <56998EA7.5020603@mind.be>
Message-ID: <CAAXf6LXxfQ30hmckm+W6immDESecEkvFduybG4VRCy6gVe6dVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for all your suggestions. I addressed them in v2, just some note below...

On Sat, Jan 16, 2016 at 1:28 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
[..]
>> +
>> +import csv
>> +import argparse
>> +
>> +def read_packages_csv(inputf, detail=None):
>
>  Given the name of the input file read_file_size_stats_csv would be a more
> natural name.

I removed the _stats_ suffix to match the argument names of size-stats
(and also because it reads better).

The history of these 'packages' names was because I started out
without the --detail option, and read in the package-size-stats.csv
files.

[..]
>
>> +    for pkg in result.keys():
>> +        if abs(result[pkg]) < threshold:
>
>  I think <= would be more natural here. Then you can pass -t 0 to get rid of all
> packages that remain equal.
>
>  Also a nice extension for a future patch would be to support K, M, G in the
> threshold.
>
>> +            continue
>> +        print '%12d %s' % (result[pkg], pkg)
>
>  I think it would be better if the output was also CSV. If it is not CSV, please
> make it python3-compatible by adding () around the argument.
>
>  A nice additional feature would be if the output CSV would (optionally?)
> contain all the info from the original CSVs. But that can be follow-up patch, of
> course.
>

In order to start small, I added these suggestions in a TODO at the
top of the script.

For an output CSV, I think it should in any case be in addition of
standard textual output, not as a replacement.
A CSV of the form:

Package name, Package size 1, Package size 2, Difference

could easily be created, and similar for the --detail switch with files.

However, one big accumulated file-size-stats.csv extension including
differences looks difficult to me: how would it be organized? Already
now, the package size is duplicated for each file belonging to that
package. Adding both file and package size differences to each line
would become a nightmare. I think we need to choose between package or
file output.

/Thomas
