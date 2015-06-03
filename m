From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 3 Jun 2015 10:50:28 -0500
Subject: [Buildroot] [PATCH v4 2015.08 2/4] support/scripts: add
 size-stats script
In-Reply-To: <1432591007-27689-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1432591007-27689-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1432591007-27689-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CANn-YGSgXy4fTJtw3mJyFF-4zkWbBh_hg_qWNLcFu5cdjk3XbA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, May 25, 2015 at 4:56 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This new script uses the data collected by the step_pkg_size
> instrumentation hook to generate a pie chart of the size contribution
> of each package to the target root filesystem, and two CSV files with
> statistics about the package size and file size. To achieve this, it
> looks at each file in $(TARGET_DIR), and using the
> packages-file-list.txt information collected by the step_pkg_size
> hook, it determines to which package the file belongs. It is therefore
> able to give the size installed by each package.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/scripts/size-stats | 238 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 238 insertions(+)
>  create mode 100755 support/scripts/size-stats
>
> diff --git a/support/scripts/size-stats b/support/scripts/size-stats
> new file mode 100755
> index 0000000..48a64cd
> --- /dev/null
> +++ b/support/scripts/size-stats

> +import sys
> +import os
> +import os.path
> +import argparse
> +import csv
> +import collections
> +
> +try:

Would it be possible to add in the following lines here to ensure the
graphing does not try to connect to an X-server?

import matplotlib
matplotlib.use('Agg')

I ran into an issue testing this on my setup where I ssh into my build
server using screen. I found this solution on stack overflow at the
following link.

http://stackoverflow.com/questions/4706451/how-to-save-a-figure-remotely-with-pylab/4706614#4706614

> +    import matplotlib.font_manager as fm
> +    import matplotlib.pyplot as plt
> +except ImportError:
> +    sys.stderr.write("You need python-matplotlib to generate the size graph\n")
> +    exit(1)

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
