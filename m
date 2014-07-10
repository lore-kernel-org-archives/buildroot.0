From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Jul 2014 17:59:47 +0200
Subject: [Buildroot] [PATCH 2/5] support/download: properly use temp
	files
In-Reply-To: <20140709094510.50159656@free-electrons.com>
References: <cover.1404681878.git.yann.morin.1998@free.fr>
 <3c2e529b6f9c542dba662b08b54f844f275e23ee.1404681878.git.yann.morin.1998@free.fr>
 <53BA3A1A.1000307@mind.be> <20140707213802.GC3806@free.fr>
 <20140709094510.50159656@free-electrons.com>
Message-ID: <20140710155947.GB28300@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-09 09:45 +0200, Thomas Petazzoni spake thusly:
> On Mon, 7 Jul 2014 23:38:02 +0200, Yann E. MORIN wrote:
> 
> > >  Not really related to this patch, but why do we need this ${tmp_dl} to begin
> > > with? Especially since we're already "occupying" a tempfile in DL_DIR anyway.
> > 
> > The idea was not to pollute BR2_DL_DIR, in case the download fails.
> > Hence this dance:
> >   - download to a disposable area (BUILD_DIR);
> >   - move to a temp file in BR2_DL_DIR;
> >   - atomically rename to the final file.
> 
> And also because $(DL_DIR) and $(BUILD_DIR) might be on different
> filesystems, so the rename/move of the file from $(BUILD_DIR) (where it
> was downloaded) to $(DL_DIR) may not be atomic. Hence the idea is to:
> 
>  - Download in $(BUILD_DIR)
> 
>  - Move to a temporary file in $(DL_DIR). This operation may not be
>    atomic if $(DL_DIR) is not on the same filesystem as $(BUILD_DIR)
> 
>  - Finally rename the temporary file to the expected file name in
>    $(DL_DIR). Since we're in the same directory, it's guaranteed to be
>    atomic.
> 
> This allows to ensure that when the final file appears in $(DL_DIR),
> we're sure the download is finished, and that therefore concurrently
> executing Buildroot instances will either not see the downloaded file,
> or see a fully completed downloaded file.
> 
> Or am I missing the point of the discussion here?

Not as far as I'm concerned.

Except that Arnout's (and Peter's) concerns where that the way I
implemented that was not optimal, and I used convoluted constructs to
achieve this non-cluttering and atomicity.

I have to re-write my copy! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
