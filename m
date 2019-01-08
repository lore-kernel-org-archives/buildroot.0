From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Jan 2019 20:27:34 +0100
Subject: [Buildroot] [PATCH 11/19] support: introduce new format for
 packages-file-list files
In-Reply-To: <CAAXf6LXJODkqEabq-kUm2b6gzR1dcYj1uai3y+C-YW94BFsudQ@mail.gmail.com>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <a6a18c80f4da8160fd36529a8a4bed22c39a96cb.1546898693.git.yann.morin.1998@free.fr>
 <CAAXf6LXJODkqEabq-kUm2b6gzR1dcYj1uai3y+C-YW94BFsudQ@mail.gmail.com>
Message-ID: <20190108192734.GL19623@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-01-08 16:07 +0100, Thomas De Schampheleire spake thusly:
> El lun., 7 ene. 2019 a las 23:06, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
> > The existing format for the packages-files lists has two drawbacks:
[--SNIP--]
> > AS such, introduce a new format for those files, that solves both
> > issues.
[--SNIP--]
> > +# Read the binary-opened file object f with \0\n separated records (aka lines).
> > +# Highly inspired by:
> > +# https://stackoverflow.com/questions/19600475/how-to-read-records-terminated-by-custom-separator-from-file-in-python
> > +def _readlines0n(f):
> > +    buf = b''
> > +    while True:
> > +        newbuf = f.read(1048576)
> I would find 1024 * 1024 more readable.

We definitely have a different eyesight, as I find this easier to grok! ;-)

I should note that we absolutely do not care about the size we buffer.
We could very well read it whole, or use smaller chunks (the original
inspiration read 4kiB blocks).

But I can switch to 1024*1024.

[--SNIP--]
> >  # Iterate on all records of the packages-file-list file passed as filename
> >  # Returns an iterator over a list of dictionaries. Each dictionary contains
> >  # these keys (others maybe added in the future):
> > @@ -12,11 +32,11 @@ import subprocess
> >  # 'pkg':  the last package that installed that file
> >  def parse_pkg_file_list(path):
> >      with open(path, 'rb') as f:
> I now understand why you read as binary.

Even though here we really want to read a binary file, we already wanted
to in the previous patch, because filenames can be any binary sequence.

> > -        for rec in f.readlines():
> > -            l = rec.split(',0')
> I still think this ',0' was wrong.

Yes it was, I'll fix it (well, I already fixed it now).

> > +        for rec in _readlines0n(f):
> > +            srec = rec.split(b'\x00')
> >              d = {
> > -                  'file': l[0],
> > -                  'pkg':  l[1],
> > +                  'file': srec[0],
> > +                  'pkg':  srec[1],
> and I now see how the swap in a previous commit could go unnoticed in
> your testing :-)

Yeah. Thanks for spotting it. I'll still fix the interim patches to be
consistent.

Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
