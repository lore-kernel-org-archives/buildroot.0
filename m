From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Apr 2017 11:25:33 +0200
Subject: [Buildroot] [PATCH 2/2] mke2img: add parameter sanity checks to
 prevent odd error messages from genext2.fs
In-Reply-To: <20170429210606.37872b68@free-electrons.com>
References: <1493481682-128366-1-git-send-email-g4@novadsp.com>
 <1493481682-128366-2-git-send-email-g4@novadsp.com>
 <20170429210606.37872b68@free-electrons.com>
Message-ID: <20170430092533.GB12749@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-04-29 21:06 +0200, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Sat, 29 Apr 2017 17:01:22 +0100, J Evans wrote:
> 
> > +    if [ -z "${nb_blocks}" ]; then
> > +        error "Error: you must specify a file system block count with '-b'. This cannot be zero, e.g. 61440 == 60MB\n"

Really, just state that it must be specified, this the value is
explained in the help text.

    error "Error: you must specify a file system block count with '-b'.\n"

However, please also update the help text at the end of the script,m to
remove a hint about auto calculation:

    https://git.buildroot.org/buildroot/tree/package/mke2img/mke2img#n152

    -b BLOCKS
        Create a filesystem of BLOCKS 1024-byte blocs. The default is to
        compute the required number of blocks.

> > +    fi
> 
> Check this is useless: there is already error checking done by getopt
> itself, because the -b option *must* have an argument. Indeed, the
> current mke2img behaves like this:
> 
> $ ./package/mke2img/mke2img -b
> mke2img: option 'b' expects a mandatory argument
> 
> So it is already checked that ${nb_blocks} cannot be empty.

But if you don't pass the -b option, then nb_blocks *is* unset.

Adding the check is correct in my opinion.

> > +    if [ "${nb_blocks}" -eq 0 ]; then
> > +        error "Error: The file system block count size cannot be zero. e.g. 61440 == 60MB \n"
> > +    fi
> 
> See my reply to the previous commit: I don't see why 0 should be
> checked specifically. Please explain in the commit log why it should be.

Agreed, a zero size is like specifying any size that is too small to fit
the content of target/. There is no way we can check that the given size
is correct.

zero if of course special, because we *know* it is incorrect. But since
this is not the default value, the user would have explicitly set it to
zero. Which is justa little tad stupid to begin with.

As I previously said: I really don't see the point of checking that the
size is not zero.

Just keep the text tht nb_blocks is set, though, because it is required.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
