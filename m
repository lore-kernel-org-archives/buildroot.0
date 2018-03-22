From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Mar 2018 08:53:21 +0100
Subject: [Buildroot] [PATCH next v2 4/5] support/scripts/pkg-stats-new:
 add latest upstream version information
In-Reply-To: <5ab31ecd94bbd_65552b0d8140b8fc5231a@ultri4.mail>
References: <20180321215824.45a5b5bc@windsurf>
 <5ab31ecd94bbd_65552b0d8140b8fc5231a@ultri4.mail>
Message-ID: <20180322085321.060cd956@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ricardo,

On Thu, 22 Mar 2018 00:11:09 -0300, Ricardo Martincoski wrote:

> I dislike the fact we make 2000+ HTTP requests, but as you explained it is a
> limitation from the current api exposed by the upstream. I even looked at the
> code hoping the mapping could be easily introduced in api v1... but no, it is
> not trivial.

I think it is easy. It should just be a matter of the following patch:

diff --git a/anitya/api.py b/anitya/api.py
index a53be43..5f0be9e 100644
--- a/anitya/api.py
+++ b/anitya/api.py
@@ -156,7 +156,7 @@ def api_projects():
     else:
         project_objs = models.Project.all(Session)
 
-    projects = [project.__json__() for project in project_objs]
+    projects = [project.__json__(detailed=True) for project in project_objs]
 
     output = {
         'total': len(projects),

I've asked upstream if they were interested, and the reply I got this
morning is:

08:48 < pingou> kos_tom: sounds fine to me, but I know that jcline has been working on a v2 api, so maybe that'll help
08:49 < kos_tom> pingou: do you think you can apply the patch I provided ?
08:49 < kos_tom> pingou: alternatively, we could make getting the detailed information optional
08:49 < pingou> kos_tom: jcline is now the one maintaining it
08:52 < kos_tom> pingou: ok :)

> So, yes. Let's do this incrementally, first let's make it work using one request
> per package, then later we improve the script when the api v2 is deployed.

Right.

> In the meanwhile, we will be able to start creating the mappings based on the
> daily generated html.

Indeed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
