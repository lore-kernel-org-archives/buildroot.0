From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Mar 2018 21:46:30 +0100
Subject: [Buildroot] Unicode problem with check-uniq-files
In-Reply-To: <20180322204145.GB4580@scaer>
References: <3a25e768-759e-e377-fcae-48c8e3e36ddd@jcz.nl>
 <20180319213240.GA340@scaer>
 <86fb507f-1fa7-8355-6ec6-7b346e6945e7@jcz.nl>
 <20180321214436.GA2085@scaer>
 <5ffd29df-7b21-122a-2d50-03fc86f29224@jcz.nl>
 <f965a6fb-db48-b39c-6f49-46a025fc63ad@jcz.nl>
 <20180322204145.GB4580@scaer>
Message-ID: <20180322204630.GC4580@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jaap, All,

On 2018-03-22 21:41 +0100, Yann E. MORIN spake thusly:
> On 2018-03-22 11:56 +0100, Jaap Crezee spake thusly:
> > On 03/22/18 11:43, Jaap Crezee wrote:
> > > ./support/scripts/check-uniq-files -t target /data/work/jcz/git/jidiot/clients/innr/buildroot_development/output/build/packages-file-list.txt
> > > Traceback (most recent call last):
> > >   File "./support/scripts/check-uniq-files", line 42, in <module>
> > >     sys.exit(main())
> > >   File "./support/scripts/check-uniq-files", line 31, in main
> > >     for row in r:
> > >   File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
> > >     return codecs.ascii_decode(input, self.errors)[0]
> > > UnicodeDecodeError: 'ascii' codec can't decode byte
> > 
> > Attached patch is working for me. If you agree with it, you can apply it.
> > If you like I can ack. If you do not agree with this patch, what do you suggest?
> 
> > diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
> > index be808cce03..82b0af24ba 100755
> > --- a/support/scripts/check-uniq-files
> > +++ b/support/scripts/check-uniq-files
> > @@ -26,7 +26,7 @@ def main():
> >          return False
> >  
> >      file_to_pkg = defaultdict(list)
> > -    with open(args.packages_file_list[0], 'r') as pkg_file_list:
> > +    with open(args.packages_file_list[0], 'r', encoding="utf-8") as pkg_file_list:
> >          r = csv.reader(pkg_file_list, delimiter=',')
> >          for row in r:
> >              pkg = row[0]
> 
> I'll be testing that, but it has to work in quite a few situations:
>   - python 2.6, python 2.7, python 3.x

It does not work with python-2.7 at least;

    Traceback (most recent call last):
      File "support/scripts/check-uniq-files", line 42, in <module>
        sys.exit(main())
      File "support/scripts/check-uniq-files", line 29, in main
        with open(args.packages_file_list[0], 'r', encoding="utf-8") as pkg_file_list:
    TypeError: 'encoding' is an invalid keyword argument for this function

So, back to the drawing board it is... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
