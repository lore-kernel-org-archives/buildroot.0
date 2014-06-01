From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Jun 2014 15:38:22 +0200
Subject: [Buildroot] [PATCH 0/11 v5] Some download-related changes
 (branch yem/check-downloads)
In-Reply-To: <20140601152441.045ec06b@free-electrons.com>
References: <cover.1399204808.git.yann.morin.1998@free.fr>
 <20140601152441.045ec06b@free-electrons.com>
Message-ID: <20140601133822.GG3430@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-01 15:24 +0200, Thomas Petazzoni spake thusly:
> On Sun,  4 May 2014 14:01:43 +0200, Yann E. MORIN wrote:
> > This series contains those download-related changes:
> 
> I have one request regarding this series: I would like all the
> temporary steps for the download procedures to take place somewhere in
> $(O), and then only after the download is completed, do an atomic
> rename of the file into $(DL_DIR).
> 
> The problem I'd like to solve is that it is currently impossible to
> share a download directory between separate, parallel, builds of
> Buildroot, because all the builds are going to use $(DL_DIR) as a
> temporary location to download things, stepping on each other if the
> different builds happen to download the same file at the same time. For
> this reason, I had to switch to one download directory per build
> instance in the autobuilder.
> 
> By downloading all the temporary files in $(O), and then doing an
> atomic rename, the other build instances will either see the file and
> use it, or not see it, and do the same procedure, with an atomic rename
> at the end. Of course, it won't work if the download directory is on a
> different filesystem, because the atomic property of file rename is
> guaranteed only inside a given filesystem. But still, it's going to be
> better than what we have today.

Well, that's basically what happens in patch 8/11 (as you noticed
already!).

You said on IRC:
    at least for the wget download method, it's still wrong.

What Arnout said is that we want to create the temporary file in the
same filesystem as for the final file.

That can only be true if we create the temp file in the same directory
as the final file, as we have no info about the mountpoints.

But, as you said you want it to work even for parallel downloads, we
will have to do a bit of a gymnastic to avoid to builds in different
directories clobbering each others temp files.

So, of course, two parallel wget will step on each other's temp file.
Ditto for the other downloaders.

So, we must create temp files and temp clones with unique names. I'll
use mktemp for that.

Thanks for the review!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
