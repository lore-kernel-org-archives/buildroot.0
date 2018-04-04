From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 22:15:02 +0200
Subject: [Buildroot] [PATCH v2] autobuild-run: prepare_build(): ignore
 directories in dldir
In-Reply-To: <20180404164025.24814-1-peter@korsgaard.com>
References: <20180404164025.24814-1-peter@korsgaard.com>
Message-ID: <20180404221502.4ba6d628@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Apr 2018 18:40:25 +0200, Peter Korsgaard wrote:
> With the change to use subdirs in dldir, prepare_build may end up trying to
> remove a non-empty subdir, causing an exception:
> 
> Process Process-1:
> Traceback (most recent call last):
>   File "/usr/lib64/python2.7/multiprocessing/process.py", line 258, in _bootstrap
>     self.run()
>   File "/usr/lib64/python2.7/multiprocessing/process.py", line 114, in run
>     self._target(*self._args, **self._kwargs)
>   File "/home/peko/buildroot-test/scripts/autobuild-run", line 627, in run_instance
>     ret = prepare_build(**kwargs)
>   File "/home/peko/buildroot-test/scripts/autobuild-run", line 301, in prepare_build
>     os.remove(os.path.join(dldir, f))
> OSError: [Errno 21] Is a directory: 'instance-0/dl/mtools'
> 
> We only want to delete individual download files, so recursively search for
> files under dldir.
> 
> With this change, flist contains the full path to the files, so also adjust
> the printing/removal logic.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  scripts/autobuild-run | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Applied to buildroot-test repo. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
