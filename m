From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Jun 2020 21:50:38 +0200
Subject: [Buildroot] [PATCH 1/1] rpi-firmware: do not rename startup
 files
In-Reply-To: <20200625192003.59506a9c@gmx.net>
References: <20200624115009.15561-1-sveyret@gmail.com>
 <20200624165405.GA20645@scaer> <20200625182319.4cec8d94@gmx.net>
 <CAFs+hh6EffMsZFsMQAXF-Lk-cRmbjtHqii2zDogRrJAMUjw9iw@mail.gmail.com>
 <20200625192003.59506a9c@gmx.net>
Message-ID: <20200625195038.GM20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, St?phane, All,

On 2020-06-25 19:20 +0200, Peter Seiderer spake thusly:
> On Thu, 25 Jun 2020 18:38:02 +0200, St?phane Veyret <sveyret@gmail.com> wrote:
> > Le jeu. 25 juin 2020 ? 18:23, Peter Seiderer <ps.report@gmx.net> a ?crit :
> > > > I think we should instead force the name of the startup files in the
> > > > config.txt (in package/rpi-firmware/config.txt):
> > > >     start_file=start.elf
> > > >     fixup_file=fixup.dat  
> > > Or one step further, copy the start/fixup file verbatim and only change the
> > > start_file/fixup_file entry in config.txt (with the advantage to make it
> > > transparent which files are installed/in-use)...  
> > If the file name is already the appropriate one (this is the first
> > version of my patch), using start_file and fixup_file is useless. And
> > I don't feel it is a good idea to set start_file and fixup_file if the
> > files already have expected names, because using these options is
> > discouraged: https://www.raspberrypi.org/documentation/configuration/config-txt/boot.md.
> 
> The options are not discouraged, but 'advanced options' and should be
> handled with care ;-)
> 
> The advantage of the explicit start_file/fixup_file entries is that it
> is clear/determined which files are used (instead of relaying on the
> RPi 'magic' depending on the combination of other options)....

That.

So, we force the files to load. We have two options:

  - always load the same known filenames, and copy the appropriate files
    and name them to those known filenames, or

  - always copy the appropriate files and keep their original filenames,
    and tweak config.txt to load the appropriate filenames, risking
    hitting some corner cases in the opaque binary blobs.

The first option has the advantage of just caring about the source of
the copy; the destiantion filenames and filenames to load are constant.

The second soltuion needs to care about the source filenames, the
destination filenames and change config.txt.

Guess which is the easiest to implement, review, and maintain? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
