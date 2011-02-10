From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Feb 2011 23:14:50 +0100
Subject: [Buildroot] [PATCH] Allow file globs in microperl module list
In-Reply-To: <1297356099-15765-1-git-send-email-mort@bork.org> (Martin Hicks's
	message of "Thu, 10 Feb 2011 11:41:39 -0500")
References: <1297356099-15765-1-git-send-email-mort@bork.org>
Message-ID: <87ipwrfsf9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Hicks <mort@bork.org> writes:

 Martin> This lets the user place file globs into the microperl module
 Martin> list.  e.g.,

 Martin> CGI/*.pm warnings.pm strict.pm

 Martin> Signed-off-by: Martin Hicks <mort@bork.org>
 Martin> ---
 Martin>  package/microperl/microperl.mk |    3 ++-
 Martin>  1 files changed, 2 insertions(+), 1 deletions(-)

 Martin> diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
 Martin> index b68e825..71a4e4a 100644
 Martin> --- a/package/microperl/microperl.mk
 Martin> +++ b/package/microperl/microperl.mk
 Martin> @@ -82,7 +82,8 @@ ifneq ($(MICROPERL_MODS),)
 Martin>  	 for i in $(patsubst %,$(TARGET_DIR)/$(MICROPERL_MODS_DIR)/%,$(dir $(MICROPERL_MODS))); do \
 Martin>  		[ -d $$i ] || mkdir -p $$i; \
 Martin>  	 done; \
 Martin> -	 for i in $(MICROPERL_MODS); do \
 Martin> +	 FILES="$(shell cd $(MICROPERL_DIR)/lib && ls $(MICROPERL_MODS))"; \
 Martin> +	 for i in $$FILES; do \
 Martin>  	 cp -dpf $(MICROPERL_DIR)/lib/$$i $(TARGET_DIR)/$(MICROPERL_MODS_DIR)/$$i; \

Why not just do:

for i in $(addprefix $(MICROPERL_DIR)/lib/,$(MICROPERL_MODS)); do ..

-- 
Bye, Peter Korsgaard
