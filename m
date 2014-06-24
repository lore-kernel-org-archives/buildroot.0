From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Jun 2014 18:26:32 +0200
Subject: [Buildroot] [RFCv1 0/4] Generating a graph of the size
 installed by each package
In-Reply-To: <53A977B4.70205@lucaceresoli.net>
References: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <53A977B4.70205@lucaceresoli.net>
Message-ID: <20140624162632.GA3478@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2014-06-24 15:05 +0200, Luca Ceresoli spake thusly:
> Thomas Petazzoni wrote:
[--SNIP--]
> >To see an example of the generated pie chart, see:
> >
> >   http://free-electrons.com/~thomas/pub/buildroot/graph-size.pdf
> >
> >The implementation consists in adding a global instrumentation hook
> >that registers which files are installed by each package. A limitation
> >of the current implementation is that when a file is installed by a
> >package A and then overriden by package B, the mechanism will assume
> >the file was installed by package A. Suggestions to welcome on how to
> >solve this in a reasonably simple way.
> 
> It's very well possible that I'm missing something, but I don't get why
> you need to save the list of all installed files.
> 
> Can't you just save the whole rootfs size before and after installation?
> It can be simply computer by 'du -bs $(TARGET_DIR)', and it's way
> easier to parse later. It would also take into account the change of
> size for overwritten files, for free.
> 
> Of course your approach collects more information, but I don't see
> these extra info used in the final graph.

What is important is not the installed size, but the actual size on the
target.

The binaries installed are not stripped at instll time, but later, just
before making the target images.

Thus, you want to wait for just before generationg the target image, but
just after stripping binaries, to compute the actual size of each
packages.

So, what the patches basically does is:
  - record for each package what files are installed
  - just after stripping, get the size of each file,
  - assign the size to the package that installed that file

Of course, as Thomas says, if two packages install the same file, the
first pacakge will be credited with the size of this file, not the last
package.

Overcoming this would not be trivial (but not impossible either.) This
can be refined in later interations of the patchset; we just need to
come up with a simple-enough heuristic. Storing sha1s of each file
before install, and comparign after install is a solution, but it is a
bit more involved than just diffing the output of 'find -type f'.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
