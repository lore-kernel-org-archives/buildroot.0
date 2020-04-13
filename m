From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 14:09:23 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/apache: atomic creation of
 pid file.
In-Reply-To: <20190923074708.9269-1-nicolas.carrier@orolia.com>
References: <20190923074708.9269-1-nicolas.carrier@orolia.com>
Message-ID: <20200413140923.1574d726@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Sep 2019 07:47:27 +0000
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> The original pattern for creating the pid file was:
> open_create(pid_file)
> write(pid_file, pid)
> close(pid_file)
> 
> But if a power outage occurs between open_create and write, the file will
> be empty and httpd will refuse to start afterwards unless the corrupt pid
> file is removed.
> 
> This patch uses the pattern:
> open_create(temp_pid_file)
> write(temp_pid_file)
> close(temp_pid_file)
> rename(temp_pid_file, pid_file)
> which is guaranteed to be atomic, provided that temp_pid_file and pid_file
> are located in the same file system, which this patch does by creating
> a temporary file name with the pattern:
>     pid_file_name + random_suffix
> 
> This patch has been submitted upstream, but did receive no answer at all:
>   https://bz.apache.org/bugzilla/show_bug.cgi?id=63140
> 
> 
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
> ---

Your patch has been merged in upstream Apache, in a slightly different
form, but is not yet part of a released version of Apache. So I've
applied your commit, but replaced your change by the one that was
ultimately applied in upstream Apache.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
