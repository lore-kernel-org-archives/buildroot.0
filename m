From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 May 2020 22:16:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpam-tacplus: fix build when
 time_t is 64 bits
In-Reply-To: <CAPi7W82cDLUa+YyzB6BYHrXwqm8OK00B-HBVrRLJm47Q7_7EQw@mail.gmail.com>
References: <20200517170507.2796394-1-fontaine.fabrice@gmail.com>
 <20200517212712.6e3b0f13@windsurf.home>
 <CAPi7W82cDLUa+YyzB6BYHrXwqm8OK00B-HBVrRLJm47Q7_7EQw@mail.gmail.com>
Message-ID: <20200517221644.0d27f444@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 May 2020 21:57:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > > +diff --git a/tacc.c b/tacc.c
> > > +index ef9d081..9260373 100644
> > > +--- a/tacc.c
> > > ++++ b/tacc.c
> > > +@@ -343,7 +343,7 @@ int main(int argc, char **argv) {
> > > +         /* start accounting */
> > > +         struct tac_attrib *attr = NULL;
> > > +
> > > +-        sprintf(buf, "%lu", time(0));
> > > ++        sprintf(buf, "%llu", time(0));  
> >
> > But isn't this going to introduce another warning when time_t is 32-bit ?  
> Yes, indeed, thanks for spotting my mistake. What would be a proper fix?
> Disable -Werror? Cast time_t into (unsigned long) as already done by
> upstream in pam_tacplus.c?

I'm far from being an expert with the POSIX time API, which is a bit
atrocious. But I believe that perhaps interpreting time_t directly is
wrong, and instead this should be done:

	time_t t;
	struct tm *tm;

	t = time(NULL);
	tm = gmtime(&t);
	strftime(buf, sizeof(buf), "%s", tm);

Again, I'm not sure, so more research would be useful.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
