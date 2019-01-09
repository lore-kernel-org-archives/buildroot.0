From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Jan 2019 19:10:01 +0100
Subject: [Buildroot] [PATCH 00/19] support: limit install-time
 instrumentation to current package's files (branch yem/files-list-2)
In-Reply-To: <CAAXf6LUZ6OouT40zROoSZ6h-ws2u4b8zY0+OwQmyvUgT9Kz9HQ@mail.gmail.com>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <CAAXf6LWsWTntZdve0sGs8HDJSS9=RKeupaYTYO2TuG3oEHdf+A@mail.gmail.com>
 <CAAXf6LXj1_YNqd4N9Jr=ygi2YgN3fYYCEjkhzD=xaH5Lco6Pqg@mail.gmail.com>
 <20190108213037.GI4022@scaer>
 <CAAXf6LUZ6OouT40zROoSZ6h-ws2u4b8zY0+OwQmyvUgT9Kz9HQ@mail.gmail.com>
Message-ID: <20190109181001.GL4022@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-01-09 14:39 +0100, Thomas De Schampheleire spake thusly:
> El mar., 8 ene. 2019 a las 22:30, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
[--SNIP--]
> > But for a more generic solution, we'd need a way to detect files that
> > were not previously present but now are.
> >
> > So we'd need to maintain a list of files from before the installation
> > and another for after the installation. And oh wait, isn't that
> > basically what we previously did (modulo the md5)? ;-)
> 
> Without md5sum, there is only a find before and after each package
> installation, which shouldn't take long.
> 
> The md5 is only necessary if you care about changing existing files.
> And normally, if you change existing files, their timestamp will be
> updated, so your solution with '-newer-than foo_before' should be
> fine. Only when you change files and still keep their old timestamps,
> would something be missed.
> 
> So, a possible solution could be a combination of the original 'find
> before+after' solution and your new 'newer-than foo_before' solution.
> Am I talking gibberish?

Now that I slept on it, detecting and fixing this problem appropriately
is impossible, unless we re-instate the leading md5sum as well.

If you allow for a package to install a file in the past, how do you
know that the file indeed did not previously exist?

That is, if the file did not previously exist, then comparing the list
before/after would indeed detect it. However, if the file did previously
exist, then your package would overwrite it *and* set it in the past,
and then comparing the list before/after would not detect it.

And in either case, our find -newer would not detect it either.

So, the only way to properly account for this situation would be, guess
what, to reinstate an md5sum before and after the installation and
compare them file by file.

However, as we've seen, this is totally unacceptable.

So, I hereby declare that I think that I believe that in my opinion I
can only think that a package which installs a file in the past is
broken (or borked, as you may prefer). ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
