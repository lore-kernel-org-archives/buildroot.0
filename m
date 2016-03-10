From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 10 Mar 2016 13:30:33 +0100
Subject: [Buildroot] [PATCH v7 06/18] core: make host *-config scripts
	relocatable
In-Reply-To: <56E0BBF1.8020604@mind.be>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-7-git-send-email-s.martin49@gmail.com>
 <56E0BBF1.8020604@mind.be>
Message-ID: <CAHXCMM+OECofOXVVpLrGhv98qoe90BmG8+pjasj7DMHYfjAf1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 10, 2016 at 1:12 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 03/09/16 23:58, Samuel Martin wrote:
>>
>> This change adjusts the _CONFIG_SCRIPTS hook to set add {exec_,}prefix
>> computed
>> relatively to the script location.
>>
>> This patch only fixes *-config scripts located in the host area, those
>> from the target and staging area are already handled.
>>
>> This hook is a kind of brute-force sed on all files matching '*-config'
>> in the $(HOST_DIR)/usr/bin directory. This allows correctly handle
>> script whose name may depends on the host system, not the target
>> configuration (e.g. ncurses can be configured for the target to be
>> ncurses6w, so ncurses6w-config ; whereas for the host it will be
>> ncurses5, so ncurses5-config).
>> Since there way less host packages than target ones, it is reasonable to
>> assume that processing all *-config scripts found when a host package
>> (whose target package set the *_CONFIG_SCRIPTS variable) is fairly short
>> and does not add its overhead not even noticeable.
>
>
>  I don't agree with this on the principle that we like to handle things
> explicitly, rather than having some automagic stuff that is hard to
> pinpoint.

Right! I forgot this point that someone (certainly you) already
pinpointed during the last BR dev. days.

> So I think we should just set the appropriate
> HOST_*_CONFIG_SCRIPTS variables. To alleviate the situation, we could add a
> ?= in generic-package, so only the cases where the host script deviates from
> the target script (or where there is no target package) have to be handled.
> Probably just ncurses.

Let's do so


-- 
Samuel
