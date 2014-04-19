From: Mike Zick <minimod@morethan.org>
Date: Sat, 19 Apr 2014 09:17:26 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-10
In-Reply-To: <53515283.5060106@mind.be>
References: <20140411063008.70B85100F1F@stock.ovh.net>
 <87d2go5oz3.fsf@dell.be.48ers.dk> <20140411093044.07729d79@skate>
 <87y4zc47il.fsf@dell.be.48ers.dk>
 <20140411065158.0a9308de@core2quad.morethan.org>
 <20140411141346.49e1251a@skate> <20140411123931.GZ4096@tarshish>
 <20140411145923.21a38b08@skate> <87r4543r0z.fsf@dell.be.48ers.dk>
 <53515283.5060106@mind.be>
Message-ID: <20140419091726.6fa3dba0@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 18 Apr 2014 18:27:47 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> >  > Aah, exactly! Except that the download was not interrupt by
> >  > doing a Ctrl+C, and it's actually wget which retried the
> >  > download. And:  
> >   
> >  > 2014-04-08 04:27:12 (3.70 MB/s) - Connection closed at byte
> >  > 1057288. Retrying.  
> >   
> >  > The size at which the download was interrupted matches exactly my
> >  > findings.  
> >   
> >  > Is it a bug in wget? Some option we forgot to pass to wget?  
> > 
> > Seems like a bug to me. I don't see how this could ever be valid
> > behaviour.  
> 
>  Could also be a bug in the server: if it claims to support the Range:
> option, then wget will try to use it. But if the server then returns
> the start of the file instead of the request offset, you'll end up
> with this corrupted file.
>

I played with this a bit to see what the possibilities might be.
I **did not** attempt to find a server that lies in its headers.

I don't see how to deal with this, without some text processing
of the wget message output.

What you see below is:

wget -S <target file>
dd just the first part of the file, to make wget think it was
only a partial download
wget -S -c <target file>

Then made the presumption that this particular server was
functioning correctly (and my network connection did not have
a drop-out in connectivity).

I also assumed there wasn't two attempts to download the same
file with wget running at the same time (such as an in-parallel
jobs error).

I.E: Just looking at what text information is available in 
"normal" operation.

What looks to be most useful is the "bottom line" - that:
2014-04-19 08:52:40 (657 KB/s) - `avahi-0.6.31.tar.gz' saved [1268686/1268686]

If the file on disk is not [xxx/1268686] then there was an
un-detected error -
make a call for human intervention (i.e: an error message and stop).

The following is the terminal capture of what I tested,
perhaps it will give someone a better idea.

core2quad ~ $ wget -S http://pkgs.fedoraproject.org/repo/pkgs/avahi/avahi-0.6.31.tar.gz/2f22745b8f7368ad5a0a3fddac343f2d/avahi-0.6.31.tar.gz
--2014-04-19 08:47:22--  http://pkgs.fedoraproject.org/repo/pkgs/avahi/avahi-0.6.31.tar.gz/2f22745b8f7368ad5a0a3fddac343f2d/avahi-0.6.31.tar.gz
Resolving pkgs.fedoraproject.org... 209.132.181.4
Connecting to pkgs.fedoraproject.org|209.132.181.4|:80... connected.
HTTP request sent, awaiting response... 
  HTTP/1.1 200 OK
  Date: Sat, 19 Apr 2014 13:47:14 GMT
  Server: Apache/2.2.15 (Red Hat)
  Last-Modified: Tue, 14 Feb 2012 22:55:18 GMT
  ETag: "10599-135bce-4b8f47d25c180"
  Accept-Ranges: bytes
  Content-Length: 1268686
  Keep-Alive: timeout=5, max=500
  Connection: Keep-Alive
  Content-Type: application/x-gzip
Length: 1268686 (1.2M) [application/x-gzip]
Saving to: `avahi-0.6.31.tar.gz'

100%[=============================================================================================>] 1,268,686    659K/s   in 1.9s    

2014-04-19 08:47:24 (659 KB/s) - `avahi-0.6.31.tar.gz' saved [1268686/1268686]

core2quad ~ $ ls -dl ava*
-rw-rw-r-- 1 mszick mszick 1268686 2012-02-14 16:55 avahi-0.6.31.tar.gz
core2quad ~ $ mv avahi-0.6.31.tar.gz avahi-0.6.31.tar.gz.org
core2quad ~ $ dd if=avahi-0.6.31.tar.gz.org of=avahi-0.6.31.tar.gz bs=4096 count=10
10+0 records in
10+0 records out
40960 bytes (41 kB) copied, 0.00015004 s, 273 MB/s


core2quad ~ $ wget -S -c http://pkgs.fedoraproject.org/repo/pkgs/avahi/avahi-0.6.31.tar.gz/2f22745b8f7368ad5a0a3fddac343f2d/avahi-0.6.31.tar.gz
--2014-04-19 08:52:38--  http://pkgs.fedoraproject.org/repo/pkgs/avahi/avahi-0.6.31.tar.gz/2f22745b8f7368ad5a0a3fddac343f2d/avahi-0.6.31.tar.gz
Resolving pkgs.fedoraproject.org... 209.132.181.4
Connecting to pkgs.fedoraproject.org|209.132.181.4|:80... connected.
HTTP request sent, awaiting response... 
  HTTP/1.1 206 Partial Content
  Date: Sat, 19 Apr 2014 13:52:30 GMT
  Server: Apache/2.2.15 (Red Hat)
  Last-Modified: Tue, 14 Feb 2012 22:55:18 GMT
  ETag: "10599-135bce-4b8f47d25c180"
  Accept-Ranges: bytes
  Content-Length: 1227726
  Content-Range: bytes 40960-1268685/1268686
  Keep-Alive: timeout=5, max=500
  Connection: Keep-Alive
  Content-Type: application/x-gzip
Length: 1268686 (1.2M), 1227726 (1.2M) remaining [application/x-gzip]
Saving to: `avahi-0.6.31.tar.gz'

100%[+++==========================================================================================>] 1,268,686    657K/s   in 1.8s    

2014-04-19 08:52:40 (657 KB/s) - `avahi-0.6.31.tar.gz' saved [1268686/1268686]
