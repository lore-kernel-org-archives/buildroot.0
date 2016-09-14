From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Sep 2016 13:45:12 +0200
Subject: [Buildroot] [PATCH 3/3] package/nginx-naxsi: add missing pcre
 dependency
In-Reply-To: <c4abd31c-7224-7d6f-a3b0-cb1ce295caa9@mind.be>
References: <20160912192324.23682-1-s.martin49@gmail.com>
 <20160912192324.23682-3-s.martin49@gmail.com>
 <ce6702df-b7fe-dc20-87cd-366bec948482@mind.be>
 <CAHXCMM+RX=zVG8zqjjW6m9BfuZ_HQwdakcCtBCXEMPJ6qY+-Ww@mail.gmail.com>
 <c4abd31c-7224-7d6f-a3b0-cb1ce295caa9@mind.be>
Message-ID: <20160914134512.5d8a1e91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Sep 2016 19:30:19 +0200, Arnout Vandecappelle wrote:

> > Nope, this is not needed.
> > naxsi is a nginx' module, built by nginx.mk, which already has an
> > automatic dependency on pcre when selected.  
> 
>  I don't think we should rely on transitive dependencies. naxsi.h #include's
> pcre.h, so there should be an explicit dependency in the .mk file.
> 
>  Whenever you don't have that, the 'select' in Config.in should carry a comment
> explaining why not (usually 'runtime dependency').

It's not a transitive dependency here. The interaction between
nginx-naxsi and nginx is very special: nginx-naxsi is only in charge of
downloading source code, and provide it to nginx during its build
process. nginx is the one that *depends* on nginx-naxsi, so that
nginx-naxsi has downloaded and extracted its source code before nginx
gets configured.

So, nginx-naxsi is the one that really needs pcre (so it makes sense
for it to select pcre). But it terms of build ordering, pcre is only
really needed before nginx starts its configuration step.

So I believe the current situation is OK, with the exception that
nginx-naxsi/Config.in should have a comment that explains that.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
