From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 2 Feb 2016 03:15:44 -0500
Subject: [Buildroot] uClibc-admins post from martin@barkynet.com
 requires approval
In-Reply-To: <20151202233118.GH23754@vapier.lan>
References: <mailman.2362.1449086836.25824.uclibc-admins@busybox.net>
 <CAC1BbcQHvWVm9LxysSR=6605h1C7Kk-Dg2thMNE4CKq3_KpPNw@mail.gmail.com>
 <878u5cfs82.fsf@dell.be.48ers.dk>
 <20151202220028.GG23754@vapier.lan>
 <87a8pse9tb.fsf@dell.be.48ers.dk>
 <20151202233118.GH23754@vapier.lan>
Message-ID: <20160202081544.GA7732@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02 Dec 2015 18:31, Mike Frysinger wrote:
> On 02 Dec 2015 23:59, Peter Korsgaard wrote:
> > >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
> > 
> >  > i've added a bugzilla component, but not sure that'll really help smooth
> >  > over this scenario.  i looked at the API available, but i'm not seeing a
> >  > callback to update the versions list.
> >  > 	https://www.bugzilla.org/docs/4.4/en/html/api/
> > 
> >  > there is one to get the current list:
> >  > 	https://www.bugzilla.org/docs/4.4/en/html/api/Bugzilla/WebService/Product.html
> > 
> >  > maybe the buildroot release scripts can print a reminder ?
> > 
> > It actually already does, it was just late and I forgot:
> > 
> > echo "also don't forget to add the version to bugzilla"
> 
> there is an update API:
> 	https://www.bugzilla.org/docs/4.4/en/html/api/Bugzilla/WebService/Product.html#update
> 
> but version fields aren't yet exposed.  there's an open bug upstream w/code,
> but looks like things have stalled.  i'll let you know if/when that shows up.
> 	https://bugzilla.mozilla.org/show_bug.cgi?id=777047

i've deployed a module to our bugs instance after the 5.0 upgrade and the
conversion to the new rest api.  i've verified it works on bugstest, so
you should give it a spin on the main bugs instance next time there is a
release and let me know how it goes.

here's how i did it:
(1) login:
  $ curl 'https://bugstest.busybox.net/rest/login?login=<user>&password=<pass>'
  {"id":409,"token":"920-ljDS89ajkl"}
(2) create the version:
  $ curl -i -X POST 'https://bugstest.busybox.net/rest/vvversion?product=Buildroot&name=<version>&token=920-ljDS89ajkl'
  {"id":281}
(3) logout:
  $ curl 'https://bugstest.busybox.net/rest/logout?token=920-ljDS89ajkl'
  {"result":null}
the responses are all obviously JSON, so it should be easy to unpack.

if you run step (2) more than once, it will throw an error, so don't
worry about creating duplicate entries.
  {"message":"The version '2016.16' already exists for product 'buildroot'.","code":32000,"error":true,...}

if you want to know more about the REST API, check out:
	https://bugzilla.readthedocs.org/en/latest/api/
and maybe also this python cli:
	https://github.com/williamh/pybugz
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160202/19f56799/attachment.asc>
