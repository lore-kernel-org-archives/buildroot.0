From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Jan 2019 17:28:59 +0100
Subject: [Buildroot] [PATCH v4] support/scripts/pkg-stats: add latest
 upstream version information
In-Reply-To: <CANQCQpaRYaQqob=i_H+vzJLa+tkQmnfPA1JDjKi5gTuaPaHyEA@mail.gmail.com>
References: <20190101171729.8012-1-thomas.petazzoni@bootlin.com>
 <CANQCQpaRYaQqob=i_H+vzJLa+tkQmnfPA1JDjKi5gTuaPaHyEA@mail.gmail.com>
Message-ID: <20190103172859.26441562@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for the testing!

On Thu, 3 Jan 2019 10:19:08 -0600, Matthew Weber wrote:

> > +def release_monitoring_get_latest_version_by_distro(name):
> > +    try:
> > +        req = requests.get(os.path.join(RELEASE_MONITORING_API, "project", "Buildroot", name))  
> 
> I noticed this was required during testing.  I'm not sure if it was my
> proxy, python version or a certificate issue on their end.  I had to
> disable ssl verification as the release monitoring site redirects to
> https when you access it and the cert check fails.
> 
> req = requests.get(os.path.join(RELEASE_MONITORING_API, "project",
> "Buildroot", name), verify=False)

Weird, it was working fine here. However, in the v5, I'm using
HTTPSConnectionPool(), and I properly handled (I think!) the
certificate stuff.

> With this patch, I generated the following.  Nothing looks like it was
> incorrect at first glance....
> https://rc-matthew-l-weber.github.io/misc/stats.html

Well, nothing was visibly wrong: in the v4, when there is an exception
when doing a requests.get(), the code returns (False, None, None),
which is the same as "not result was found". So basically, the result
"Not found" in the "Last version" column could mean that the HTTP
request failed.

In the v5, I've implemented proper error handling, so that in the
results we can make the difference between "no result was found" and
"something when wrong when retrieving the results".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
