From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 21:06:06 +0200
Subject: [Buildroot] [PATCH 2/2] mke2img: add parameter sanity checks to
 prevent odd error messages from genext2.fs
In-Reply-To: <1493481682-128366-2-git-send-email-g4@novadsp.com>
References: <1493481682-128366-1-git-send-email-g4@novadsp.com>
 <1493481682-128366-2-git-send-email-g4@novadsp.com>
Message-ID: <20170429210606.37872b68@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 17:01:22 +0100, J Evans wrote:

> +    if [ -z "${nb_blocks}" ]; then
> +        error "Error: you must specify a file system block count with '-b'. This cannot be zero, e.g. 61440 == 60MB\n"
> +    fi

Check this is useless: there is already error checking done by getopt
itself, because the -b option *must* have an argument. Indeed, the
current mke2img behaves like this:

$ ./package/mke2img/mke2img -b
mke2img: option 'b' expects a mandatory argument

So it is already checked that ${nb_blocks} cannot be empty.

> +    if [ "${nb_blocks}" -eq 0 ]; then
> +        error "Error: The file system block count size cannot be zero. e.g. 61440 == 60MB \n"
> +    fi

See my reply to the previous commit: I don't see why 0 should be
checked specifically. Please explain in the commit log why it should be.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
