From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sun, 12 Jul 2020 21:44:16 +0200
Subject: [Buildroot] [PATCH v2 3/9] support/scripts/cve.py: Switch to
 JSON 1.1
In-Reply-To: <20200710112245.1044073-14-gregory.clement@bootlin.com>
References: <20200710112245.1044073-1-gregory.clement@bootlin.com>
 <20200710112245.1044073-14-gregory.clement@bootlin.com>
Message-ID: <ca9bdc90-8572-1d6a-19d7-48f7fd6db65e@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gregory,


On 10/07/20 13:22, Gregory CLEMENT wrote:
> In 2019, the JSON vulnerability feeds switched from version 1.0 to
> 1.1.

[--SNIP--]

> +    def parse_node(self, node):
> +        """
> +        Parse the node inside the configurations section to extract the
> +        cpe information usefull to know if a product is affected by
> +        the CVE. Actually only the product name and the version
> +        descriptor are needed, but we also provide the vendor name.
> +        """
> +
> +        # The node containing the cpe entries matching the CVE can also
> +        # contain sub-nodes, so we need to manage it.
> +        for child in node.get('children', ()):
> +            self.parse_node(child)


This doesn't do anything, because the values yielded in the recursive 
call to self.parse_node() are not used. The generator should be consumed 
like this (Python 2 and 3)

for child in node.get('children', ()):
     for parsed_node in self.parse_node(child):
         yield parsed_node

or with a more recent syntax (Python >=3.4)

for child in node.get('children', ()):
     yield from self.parse_node(child)


Also, if I understand correctly, this does not check if the CPE nodes 
have to be ORed or ANDed.

Some time ago, I looked into the switch to the v1.1 of the NVD files, 
but somehow lamely forgot about it afterwards. This is the function I 
came up with to determine if a package at a given version would match a 
certain tree of CPE rules: http://paste.awesom.eu/Dxcv , maybe that 
could help.

Best regards,

Titouan
