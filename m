From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Jun 2021 14:45:09 +0200
Subject: [Buildroot] [PATCH v6 1/5] package/bmap-tools: new package
In-Reply-To: <20210625123514.GB104638@scaer>
References: <20210621210111.363433-1-thomas.petazzoni@bootlin.com>
 <20210621210111.363433-2-thomas.petazzoni@bootlin.com>
 <20210625123514.GB104638@scaer>
Message-ID: <20210625144509.5b5ea897@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 25 Jun 2021 14:35:14 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I am not too sure what bmap provides over 'dd conv=sparse'...
> 
> dd has a blocking size, which can be adjusted to the underlying device,
> and does not need the input file to actually be sparse (i.e. any
> block-aligned runs of zeroes will not be transfered)...
> 
> Also, we have seen in the past that not writing zero-blocks on the
> destination device, can lead to filesystem corruption, because all-zero
> filesystem metadata suddenly may no longer be all-zero...

Well, this is precisely avoided by bmaptools I believe. bmaptools is
not about skipping zeroes, it's about skipping holes in sparse files.
So if a filesystem utility has explicitly written a huge amount of
zeroes, it's not a hole in the file, and therefore they will be written
as expected by bmaptools.

And with that, there are no risk: block filesystems do not make
assumptions about the state of the data they have not explicitly
written/initialized at the time of mkfs.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
