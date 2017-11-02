From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Nov 2017 21:55:39 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171102210456.23b1576a@windsurf>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf> <20171102174338.GD3238@scaer>
 <20171102210456.23b1576a@windsurf>
Message-ID: <20171102205539.GB30054@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Andr?, All,

Andr?, I'm dragging you into the discussion because we're seeing build
failures that only occur on your autobuilder (at least for now), see
below...

On 2017-11-02 21:04 +0100, Thomas Petazzoni spake thusly:
> On Thu, 2 Nov 2017 18:43:38 +0100, Yann E. MORIN wrote:
[--SNIP--]
> > > >         m68k |                   tremor-19427 | TIM | http://autobuild.buildroot.net/results/5bff9fbd24264b3515a669d585e10ef23127d569 |     
> > > >       mipsel |                   tremor-19427 | TIM | http://autobuild.buildroot.net/results/d1c8e74477797b597c38186343e4d6c69b05560d |       
> > > 
> > > SVN repo is dead, and it locks up the build until we time out? Doesn't
> > > look great. Yann? :-)  
> > The repository is not dead from here, though:
> > 
> >     $ svn ls http://svn.xiph.org/trunk/Tremor
> >     Redirecting to URL 'https://svn.xiph.org/trunk/Tremor':
> >     Error validating server certificate for 'https://svn.xiph.org:443':
> >      - The certificate is not issued by a trusted authority. Use the
> >        fingerprint to validate the certificate manually!
> >     Certificate information:
> >      - Hostname: xiph.org
> >      - Valid: from Mar 31 21:45:50 2016 GMT until Mar 31 21:45:50 2018 GMT
> >      - Issuer: StartCom Class 2 IV Server CA, StartCom Certification
> >        Authority, StartCom Ltd., IL
> >      - Fingerprint:
> >        B9:AF:55:63:87:0A:45:9C:BD:B9:39:43:08:DA:7C:CA:87:20:BF:11
> >     (R)eject, accept (t)emporarily or accept (p)ermanently? t
> >     CHANGELOG
> >     COPYING
> >     [...]
> > 
> > But there is an https redirect, and the certificate is not recognised
> > somehow (my Firefox has no problem with it, though)...
> > 
> > We should probably at least add '--non-interactive' to have it at least
> > fail if it needs to prompt.
> 
> It is not normal that we timeout. Instead, we should gracefully
> fallback on using http://sources.buildroot.net/tremor-19427.tar.gz
> instead.
> > We could also make use of '--trust-server-cert-failures=ARG' where ARG
> > is one of 'unknown-ca', 'cn-mismatch', 'expired', 'not-yet-valid' or
> > 'other'. But I am a bit reluctant at silently quiesce certificate
> > errors...
> 
> No, I just want the svn command to fail, and fallback to the backup
> mirror, if that is possible.

The problem I have is that I can not reproduce the timeout, because it
does work for me here, so I can't even test a fix... :-/

All I have is a prompt about a failure on a certificate...

    $ http_proxy= https_proxy= LD_PRELOAD= BR2_DL_DIR=$(pwd)/yem-dl time make tremor-source </dev/null
    umask 0022 && make -C /home/ymorin/dev/buildroot/buildroot O=/home/ymorin/dev/buildroot/O/. tremor-source
    >>> tremor 19427 Downloading
    Redirecting to URL 'https://svn.xiph.org/trunk/Tremor':
    svn: E170013: Unable to connect to a repository at URL 'https://svn.xiph.org/trunk/Tremor'
    svn: E230001: Server SSL certificate verification failed: issuer is not trusted
    --2017-11-02 21:50:41--  http://sources.buildroot.net/tremor-19427.tar.gz
    Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
    Connecting to sources.buildroot.net (sources.buildroot.net)|176.9.16.109|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 150071 (147K) [application/x-gzip]
    Saving to: ?/home/ymorin/dev/buildroot/O/build/.tremor-19427.tar.gz.kyXsJx/output?

    /home/ymorin/dev/buildroot 100%[======================================>] 146,55K   824KB/s    in 0,2s

    2017-11-02 21:50:41 (824 KB/s) - ?/home/ymorin/dev/buildroot/O/build/.tremor-19427.tar.gz.kyXsJx/output? saved [150071/150071]

    WARNING: no hash file for tremor-19427.tar.gz

    3.16user 0.20system 0:04.56elapsed 73%CPU (0avgtext+0avgdata 100384maxresident)k
    0inputs+760outputs (0major+132897minor)pagefaults 0swaps

So it looks like it is working when stdin is not a tty...

But all tremor failures happen on Andr?'s machine, so maybe there is a
other error condition on his side?

    http://autobuild.buildroot.org/?reason=tremor-19427

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
