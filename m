From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 5 Dec 2016 22:46:43 +0100
Subject: [Buildroot] [PATCHv2] vim: be more careful when removing the
 documentation
In-Reply-To: <1480970192-13208-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1480970192-13208-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <75b38bfa-b98c-cdcb-2375-4c8aab1625ed@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-12-16 21:36, Thomas Petazzoni wrote:
> The current VIM_REMOVE_DOCS hook removes all .txt files from
> /usr/share/vim. Unfortunately, this also removes the rgb.txt file,
> which is needed at runtime for vim, as reported in bug #9466.
> 
> This commit changes VIM_REMOVE_DOCS to remove only
> /usr/share/vim/vim80/doc/. Size-wise, it's equivalent because:
> 
>  - We are no longer removing a few README.txt in other directories,
>    taking more space.

 To keep things the same, we *could* still find README*.txt (instead of *.txt)
in addition to removing the doc directory. But that just makes 32K difference
(over 11MB) so not really worth it. So

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

>  - We are now removing the /usr/share/vim/vim*/doc/ folder entirely,
>    which contained a few files not named *.txt
> 
> So overall, the size of /usr/share/vim/ before and after this patch is
> still 11MB.
> 
> Fixes bug #9466.
> 
> Reported-by: Mateusz Furdyna <sir.ferdek@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v1:
> 
>  - Remove /usr/share/vim/vim*/doc/ instead of
>    /usr/share/vim/vim80/doc/ in order to make the code compatible with
>    upcoming bumps to the vim version. Suggested by Mateusz Furdyna.
> ---
>  package/vim/vim.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index d4a1f82..308855e 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -61,7 +61,7 @@ define VIM_INSTALL_RUNTIME_CMDS
>  endef
>  
>  define VIM_REMOVE_DOCS
> -	find $(TARGET_DIR)/usr/share/vim -type f -name "*.txt" -delete
> +	$(RM) -rf $(TARGET_DIR)/usr/share/vim/vim*/doc/
>  endef
>  
>  # Avoid oopses with vipw/vigr, lack of $EDITOR and 'vi' command expectation
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
