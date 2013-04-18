From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Apr 2013 09:14:31 +0200
Subject: [Buildroot] [PATCH v2 1/3] post-build: show each script
	filename before execution
In-Reply-To: <516ECA2D.6070303@mind.be>
References: <1365439816-6935-1-git-send-email-luca@lucaceresoli.net>
 <1365439816-6935-2-git-send-email-luca@lucaceresoli.net>
 <516ECA2D.6070303@mind.be>
Message-ID: <201304180914.31419.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Luca, All,

On Wednesday 17 April 2013 18:13:33 Arnout Vandecappelle wrote:
> On 08/04/13 18:50, Luca Ceresoli wrote:
> > This also simplifies code by removing the ifneq/endif clauses.
> >
> > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> > ---
> >   Makefile |    4 +---
> >   1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index c95bb1e..75f0f0c 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -509,11 +509,9 @@ endif
> >   			$${dir}/ $(TARGET_DIR); \
> >   	done
> >
> > -ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
> > -	@$(call MESSAGE,"Executing post-build script\(s\)")
> >   	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
> > +		$(call MESSAGE,"Executing  post-build script $(s)"); \
> >   		$(s) $(TARGET_DIR)$(sep))
> > -endif
> 
>   I wonder, if there are multiple scripts, won't the second MESSAGE be 
> echoed by make? I had expected that the @ would only apply to the first 
> line when they are separated with $(sep), and that each invocation would 
> run in a separate shell.

Well, it does work as expected: the two scripts I have are
properly echoed with:
>>> Executing  post-build script /blabla/script-1
[traces for script-1]
>>> Executing  post-build script /blabla/script-2
[traces for script-2]

>   By the way, a very simple alternative would be to remove the @ in front 
> of the foreach, then each script invocation will be echoed by make.

Indeed, but I also like the highlighted trace. It makes it easier to spot
the scripts traces.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
